import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/auth/auth_failure.dart';
import 'package:music_sns/domain/auth/i_auth_repository.dart';
import 'package:music_sns/domain/auth/value_objects.dart';

part 'sign_in_form_bloc.freezed.dart';
part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthRepository _authRepository;

  SignInFormBloc(this._authRepository) : super(SignInFormState.initial()) {
    on<_AccountChanged>((event, emit) {
      emit(state.copyWith(
        account: Account(event.accountStr),
        authFailureOrSuccessOption: none(),
      ));
    });
    on<_PasswordChanged>((event, emit) {
      emit(state.copyWith(
        password: Password(event.passwordStr),
        authFailureOrSuccessOption: none(),
      ));
    });
    on<_Submitted>((event, emit) async {
      if(!state.isSubmitting){
        emit(state.copyWith(
          isSubmitting: true,
        ));
        if(state.account.isValid() && state.password.isValid()){
          final failureOrSuccess = await _authRepository.signIn(
              account: state.account, password: state.password);
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
            authFailureOrSuccessOption: some(left(AuthFailure.invalidEmailAndPasswordCombination())),
          ));
        }
      }
    });
  }
}
