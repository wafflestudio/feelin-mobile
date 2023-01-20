import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/auth/auth_failure.dart';
import 'package:music_sns/domain/auth/i_auth_repository.dart';
import 'package:music_sns/domain/auth/value_objects.dart';
import 'package:rxdart/rxdart.dart';

part 'sign_up_form_bloc.freezed.dart';
part 'sign_up_form_event.dart';
part 'sign_up_form_state.dart';

@injectable
class SignUpFormBloc extends Bloc<SignUpFormEvent, SignUpFormState> {
  final IAuthRepository _authRepository;

  SignUpFormBloc(this._authRepository) : super(SignUpFormState.initial()) {
    on<_EmailAddressChanged>((event, emit) {
      emit(state.copyWith(
        emailAddress: EmailAddress(event.emailAddressStr),
      ));
    });
    on<_CodeChanged>((event, emit) {
      emit(state.copyWith(
        code: EmailAuthCode(event.codeStr),
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
                ));
          },
              (existsUsername) {
            emit(state.copyWith(
              canUseName: !existsUsername,
            ));
          },
        );
      }
    },
      transformer: (events, mapper) => events.debounceTime(const Duration(milliseconds: 500)).switchMap(mapper),);
    on<_ResetCanUseName>((event, emit) {
      emit(state.copyWith(
        canUseName: false,
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
    on<_Requested>((event, emit) async{
      final failureOrSuccess = await _authRepository.tryEmailVerification(
          emailAddress: state.emailAddress);
      failureOrSuccess.fold(
            (f) {
          emit(state.copyWith(
              isRequested: false
          ));
        },
            (_) {
          emit(state.copyWith(
            //isSubmitting: false,
              isRequested: true
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
      print('kkkkkkk');
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

        }

      }
    });
  }
}
