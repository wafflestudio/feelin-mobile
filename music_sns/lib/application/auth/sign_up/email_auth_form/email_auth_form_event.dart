part of 'email_auth_form_bloc.dart';

@freezed
class EmailAuthFormEvent with _$EmailAuthFormEvent {
  const factory EmailAuthFormEvent.emailChanged(String emailAddressStr) =
  _EmailChanged;
  const factory EmailAuthFormEvent.codeChanged(String codeStr) =
  _CodeChanged;
  const factory EmailAuthFormEvent.submitted() = _Submitted;
  const factory EmailAuthFormEvent.requested() = _Requested;
}