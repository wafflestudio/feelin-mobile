import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/auth/auth_failure.dart';
import 'package:music_sns/domain/auth/i_auth_repository.dart';
import 'package:music_sns/domain/auth/value_objects.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';
part 'sign_in_form_bloc.freezed.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthRepository _authRepository;

  SignInFormBloc(this._authRepository) : super(SignInFormState.initial()) {
    on<_EmailChanged>((event, emit) {
      emit(state.copyWith(
        emailAddress: EmailAddress(event.emailAddressStr),
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
      final failureOrSuccess = await _authRepository.signInWithEmailAndPassword(
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
            //TODO: implement to store Jwt Token using secure storage.
          ));
        },
      );
    });
  }
}
