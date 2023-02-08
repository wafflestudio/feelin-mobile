import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/auth/auth_failure.dart';
import 'package:music_sns/domain/auth/value_objects.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../infrastructure/auth/auth_repository.dart';

part 'sign_up_form_bloc.freezed.dart';
part 'sign_up_form_event.dart';
part 'sign_up_form_state.dart';

@injectable
class SignUpFormBloc extends Bloc<SignUpFormEvent, SignUpFormState> {
  final AuthRepository _authRepository;

  SignUpFormBloc(this._authRepository) : super(SignUpFormState.initial()) {
    on<_EmailAddressChanged>((event, emit) {
      emit(state.copyWith(
        emailAddress: EmailAddress(event.emailAddressStr),
      ));
    });
    on<_CodeChanged>((event, emit) {
      emit(state.copyWith(
        code: AuthCode(event.codeStr),
      ));
    });
    on<_PasswordChanged>((event, emit) {
      emit(state.copyWith(
        password: Password(event.passwordStr),
      ));
    });
    on<_PasswordConfirmChanged>((event, emit) {
      emit(state.copyWith(
        passwordConfirm: Password(event.passwordConfirmStr),
      ));
    });
    on<_NameChanged>((event, emit) {
      emit(state.copyWith(
        name: NotEmptyString(event.nameStr),
      ));
    });
    // debounce 를 이용한 사용자 이름 중복 확인
    on<_UsernameChanged>((event, emit) async {
      emit(state.copyWith(
        username: Username(event.usernameStr),
      ));
      // 유저네임 중복 확인 요청 api
      if(state.username.isValid()){
        final failureOrSuccess = await _authRepository.checkUsername(username: state.username,);
        failureOrSuccess.fold(
              (f) {
                emit(state.copyWith(
                  canUseName: false,
                  loadingUsername: false,
                ));
          },
              (existsUsername) {
            emit(state.copyWith(
              canUseName: !existsUsername,
              loadingUsername: false,
            ));
          },
        );
      }else{
        emit(state.copyWith(
          canUseName: false,
          loadingUsername: false,
        ));
      }
    },
      transformer: (events, mapper) => events.debounceTime(const Duration(milliseconds: 500)).switchMap(mapper),);
    on<_LoadingUsername>((event, emit) {
      emit(state.copyWith(
        loadingUsername: true,
      ));
    },);
    on<_ResetCanUseName>((event, emit) {
      emit(state.copyWith(
        canUseName: false,
        loadingUsername: false,
      ));
    },);
    on<_PhoneNumberChanged>((event, emit) {
      emit(state.copyWith(
        phoneNumber: PhoneNumber(event.phoneNumberStr),
      ));
    });
    on<_BirthdayChanged>((event, emit) {
      emit(state.copyWith(
        birthday: NotEmptyString(event.birthdayStr),
      ));
    });
    on<_CountryCodeChanged>((event, emit) {
      emit(state.copyWith(
        countryCode: NotEmptyString(event.countryCodeStr),
      ));
    });
    on<_EmailSubmitted>((event, emit) async {
      emit(state.copyWith(
        isSubmitting: true,
      ));
      final failureOrSuccess = await _authRepository.verifyEmail(
          emailAddress: state.emailAddress, code: state.code);
      failureOrSuccess.fold(
            (f) {
          emit(state.copyWith(
            isSubmitting: false,
            verifyFailureOrSuccessOption: some(left(f)),
          ));
        },
            (_) {
          emit(state.copyWith(
            isSubmitting: false,
            verifyFailureOrSuccessOption: some(right(unit)),
          ));
        },
      );
    });
    on<_EmailRequested>((event, emit) async{
      emit(state.copyWith(
          isEmailSubmitting: true
      ));
      final failureOrSuccess = await _authRepository.tryEmailVerification(
          emailAddress: state.emailAddress);
      failureOrSuccess.fold(
            (f) {
          emit(state.copyWith(
              isEmailSubmitting: false,
              requestFailureOrSuccessOption: some(left(f)),
          ));
        },
            (_) {
          emit(state.copyWith(
            //isSubmitting: false,
              isEmailSubmitting: false,
              requestFailureOrSuccessOption: some(right(_)),
          ));
        },
      );
    });

    on<_PhoneSubmitted>((event, emit) async {
      emit(state.copyWith(
        isSubmitting: true,
      ));
      final failureOrSuccess = await _authRepository.verifyPhone(
          phoneNumber: state.phoneNumber,countryCode: state.countryCode, code: state.code);
      failureOrSuccess.fold(
            (f) {
          emit(state.copyWith(
            isSubmitting: false,
            verifyFailureOrSuccessOption: some(left(f)),
          ));
        },
            (_) {
          emit(state.copyWith(
            isSubmitting: false,
            verifyFailureOrSuccessOption: some(right(unit)),
          ));
        },
      );
    });
    on<_PhoneRequested>((event, emit) async{
      final failureOrSuccess = await _authRepository.tryPhoneVerification(
          phoneNumber: state.phoneNumber, countryCode: state.countryCode);
      failureOrSuccess.fold(
            (f) {
          emit(state.copyWith(
            requestFailureOrSuccessOption: some(left(f)),
          ));
        },
            (_) {
          emit(state.copyWith(
            requestFailureOrSuccessOption: some(right(_)),
          ));
        },
      );
    });

    on<_SetEmail>((event, emit) {
      emit(state.copyWith(
        signUpWithEmail: true,
      ));
    });

    on<_SetPhone>((event, emit) {
      emit(state.copyWith(
        signUpWithEmail: false,
      ));
    });

    on<_Submitted>((event, emit) async {
      emit(state.copyWith(
        isSubmitting: true,
      ));
      if(state.password.isValid() &&
          state.birthday.isValid() && state.username.isValid() && state.canUseName){
        if(state.signUpWithEmail){
          final failureOrSuccess = await _authRepository.signUpWithEmail(
            emailAddress: state.emailAddress, password: state.password, name: state.name,
            username: state.username, birthday: state.birthday,
          );
          failureOrSuccess.fold(
                (f) {
              emit(state.copyWith(
                isSubmitting: false,
                authFailureOrSuccessOption: some(left(f)),
              ));
            },
                (_) {
              emit(state.copyWith(
                isSubmitting: false,
                authFailureOrSuccessOption: some(right(unit)),
              ));
            },
          );
        }else{
          final failureOrSuccess = await _authRepository.signUpWithPhone(
            phoneNumber: state.phoneNumber, countryCode: state.countryCode, password: state.password, name: state.name,
            username: state.username, birthday: state.birthday,
          );
          failureOrSuccess.fold(
                (f) {
              emit(state.copyWith(
                isSubmitting: false,
                authFailureOrSuccessOption: some(left(f)),
              ));
            },
                (_) {
              emit(state.copyWith(
                isSubmitting: false,
                authFailureOrSuccessOption: some(right(unit)),
              ));
            },
          );
        }

      }
    });
  }
}
