import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_sns/domain/auth/auth_failure.dart';
import 'package:music_sns/domain/auth/i_auth_repository.dart';
import 'package:music_sns/domain/auth/value_objects.dart';

part 'email_auth_form_event.dart';
part 'email_auth_form_state.dart';
part 'email_auth_form_bloc.freezed.dart';

@injectable
class EmailAuthFormBloc extends Bloc<EmailAuthFormEvent, EmailAuthFormState> {
  final IAuthRepository _authRepository;


  EmailAuthFormBloc(this._authRepository) : super(EmailAuthFormState.initial()) {
    on<_EmailChanged>((event, emit) {
      emit(state.copyWith(
        emailAddress: EmailAddress(event.emailAddressStr),
      ));
    });
    on<_CodeChanged>((event, emit) {
      emit(state.copyWith(
        code: EmailAuthCode(event.codeStr),
      ));
    });
    on<_Submitted>((event, emit) async {
      emit(state.copyWith(
        isSubmitting: true,
      ));
      final failureOrSuccess = await _authRepository.verifyEmail(
          emailAddress: state.emailAddress, code: state.code);
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
  }
}
