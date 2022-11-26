import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequest{
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "password")
  String password;
  @JsonKey(name: "lastName")
  String lastName;
  @JsonKey(name: "firstName")
  String firstName;
  @JsonKey(name: "username")
  String username;
  @JsonKey(name: "phoneNumber")
  String phoneNumber;
  @JsonKey(name: "birth")
  String birthday;

  SignUpRequest({
    required this.email,
    required this.password,
    required this.lastName,
    required this.firstName,
    required this.username,
    required this.phoneNumber,
    required this.birthday,
  });

  factory SignUpRequest.fromJson(Map<String, dynamic> json) => _$SignUpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}