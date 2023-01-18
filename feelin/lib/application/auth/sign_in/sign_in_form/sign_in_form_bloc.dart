import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/auth/auth_failure.dart';
import 'package:music_sns/domain/auth/i_auth_repository.dart';
import 'package:music_sns/domain/auth/token.dart';
import 'package:music_sns/domain/auth/value_objects.dart';
import 'package:music_sns/infrastructure/auth/auth_repository.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';
part 'sign_in_form_bloc.freezed.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthRepository _authRepository;

  SignInFormBloc(this._authRepository) : super(SignInFormState.initial()) {
    on<_AccountChanged>((event, emit) {
      emit(state.copyWith(
        account: Account(event.accountStr),
      ));
    });
    on<_PasswordChanged>((event, emit) {
      emit(state.copyWith(
        password: Password(event.passwordStr),
      ));
    });
    on<_Submitted>((event, emit) async {
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
        ));
      }

    });
  }
}
