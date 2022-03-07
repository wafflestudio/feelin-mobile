import 'package:music_sns/auth/login/form_submission_status.dart';

class LoginState {
  final String id;
  bool get isValidId => id.isNotEmpty;
  final String password;
  bool get isValidPassword => password.length >= 6;
  final FormSubmissionStatus formSubmissionStatus;

  LoginState({
    this.id = '',
    this.password = '',
    this.formSubmissionStatus = const InitialFormStatus(),
});

  LoginState copyWith({
    String? id,
    String? password,
    FormSubmissionStatus? formSubmissionStatus,
}){
    return LoginState(
      id : id ?? this.id,
      password: password ?? this.password,
      formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
    );
  }
}