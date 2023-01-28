import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/auth/auth_failure.dart';
import 'package:music_sns/domain/auth/exists_user.dart';
import 'package:music_sns/domain/auth/value_objects.dart';
import '../../../../infrastructure/auth/auth_repository.dart';

part 'sign_in_form_bloc.freezed.dart';
part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final AuthRepository _authRepository;

  SignInFormBloc(this._authRepository) : super(SignInFormState.initial()) {
    on<_EmailAddressChanged>((event, emit) {
      emit(state.copyWith(
        emailAddress: EmailAddress(event.emailAddressStr),
        requestFailureOrSuccessOption: none(),
      ));
    });
    on<_PasswordChanged>((event, emit) {
      emit(state.copyWith(
        password: Password(event.passwordStr),
        authFailureOrSuccessOption: none(),
      ));
    });
    on<_PhoneNumberChanged>((event, emit) {
      emit(state.copyWith(
        phoneNumber: PhoneNumber(event.phoneNumberStr),
        requestFailureOrSuccessOption: none(),
      ));
    });
    on<_CountryCodeChanged>((event, emit) {
      emit(state.copyWith(
        countryCode: NotEmptyString(event.countryCodeStr),
        requestFailureOrSuccessOption: none(),
      ));
    });
    on<_EmailRequested>((event, emit) async{
      emit(state.copyWith(
          isRequesting: true
      ));
      final failureOrSuccess = await _authRepository.checkEmail(
          emailAddress: state.emailAddress);
      failureOrSuccess.fold(
            (f) {
          emit(state.copyWith(
            isRequesting: false,
            requestFailureOrSuccessOption: some(left(f)),
          ));
        },
            (existsUser) {
          emit(state.copyWith(
            isRequesting: false,
            requestFailureOrSuccessOption: some(right(existsUser)),
          ));
        },
      );
    });
    on<_PhoneRequested>((event, emit) async{
      emit(state.copyWith(
          isRequesting: true
      ));
      final failureOrSuccess = await _authRepository.checkPhone(
          phoneNumber: state.phoneNumber, countryCode: state.countryCode);
      failureOrSuccess.fold(
            (f) {
          emit(state.copyWith(
            isRequesting: false,
            requestFailureOrSuccessOption: some(left(f)),
          ));
        },
            (existsUser) {
          emit(state.copyWith(
            isRequesting: false,
            requestFailureOrSuccessOption: some(right(existsUser)),
          ));
        },
      );
    });

    on<_SetEmail>((event, emit) {
      emit(state.copyWith(
        signInWithEmail: true,
      ));
    });

    on<_SetPhone>((event, emit) {
      emit(state.copyWith(
        signInWithEmail: false,
      ));
    });

    on<_Submitted>((event, emit) async {
      if(!state.isSubmitting){
        emit(state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ));
        if(state.signInWithEmail){
          if(state.emailAddress.isValid() && state.password.isValid()){
            final failureOrSuccess = await _authRepository.signInWithEmail(
                emailAddress: state.emailAddress, password: state.password);
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
            emit(state.copyWith(
              isSubmitting: false,
              authFailureOrSuccessOption: some(left(const AuthFailure.invalidAccountAndPasswordCombination())),
            ));
          }
        }else{
          if(state.phoneNumber.isValid() && state.countryCode.isValid() && state.password.isValid()){
            final failureOrSuccess = await _authRepository.signInWithPhone(
                phoneNumber: state.phoneNumber, countryCode: state.countryCode, password: state.password);
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
            emit(state.copyWith(
              isSubmitting: false,
              authFailureOrSuccessOption: some(left(const AuthFailure.invalidAccountAndPasswordCombination())),
            ));
          }
        }

      }
    });
  }
}
