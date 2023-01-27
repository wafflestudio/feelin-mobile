import 'package:json_annotation/json_annotation.dart';

part 'sign_up_with_email_request.g.dart';

@JsonSerializable()
class SignUpWithEmailRequest{
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "password")
  String password;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "username")
  String username;
  @JsonKey(name: "birthDate")
  String birthday;

  SignUpWithEmailRequest({
    required this.email,
    required this.password,
    required this.name,
    required this.username,
    required this.birthday,
  });

  factory SignUpWithEmailRequest.fromJson(Map<String, dynamic> json) => _$SignUpWithEmailRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpWithEmailRequestToJson(this);
}