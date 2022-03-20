abstract class LoginEvent {

}

class LoginIdChanged extends LoginEvent{
  final String id;

  LoginIdChanged({required this.id});
}

class LoginPasswordChanged extends LoginEvent{
  final String password;

  LoginPasswordChanged({required this.password});
}

class LoginSubmitted extends LoginEvent {}