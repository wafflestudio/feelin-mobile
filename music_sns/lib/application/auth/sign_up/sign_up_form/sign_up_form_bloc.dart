import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/auth/auth_failure.dart';
import 'package:music_sns/domain/auth/i_auth_repository.dart';
import 'package:music_sns/domain/auth/value_objects.dart';

part 'sign_up_form_event.dart';
part 'sign_up_form_state.dart';
part 'sign_up_form_bloc.freezed.dart';

@injectable
class SignUpFormBloc extends Bloc<SignUpFormEvent, SignUpFormState> {
  final IAuthRepository _authRepository;

  SignUpFormBloc(this._authRepository) : super(SignUpFormState.initial()) {
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
    on<_LastNameChanged>((event, emit) {
      emit(state.copyWith(
        lastName: NotEmptyString(event.lastNameStr),
      ));
    });
    on<_FirstNameChanged>((event, emit) {
      emit(state.copyWith(
        firstName: NotEmptyString(event.firstNameStr),
      ));
    });
    on<_UserNameChanged>((event, emit) {
      emit(state.copyWith(
        userName: UserName(event.userNameStr),
      ));
    });
    on<_PhoneNumberChanged>((event, emit) {
      emit(state.copyWith(
        phoneNumber: PhoneNumber(event.phoneNumberStr),
      ));
    });
    on<_Submitted>((event, emit) async {
      emit(state.copyWith(
        isSubmitting: true,
      ));
      if(state.password.isValid() && state.phoneNumber.isValid() &&
          state.userName.isValid() && state.password.value == state.passwordConfirm.value){
        final failureOrSuccess = await _authRepository.signUpWithEmail(
          emailAddress: state.emailAddress, password: state.password, lastName: state.lastName,
          firstName: state.firstName, username: state.userName, phoneNumber: state.phoneNumber,
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
    });
  }
}
