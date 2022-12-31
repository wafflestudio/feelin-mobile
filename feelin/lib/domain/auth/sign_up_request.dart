import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequest{
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
  // @JsonKey(name: "countryCode")
  // String countryCode = '+82';
  // @JsonKey(name: "phoneNumber")
  // String phoneNumber = '010-0000-1111';

  SignUpRequest({
    required this.email,
    required this.password,
    required this.name,
    required this.username,
    required this.birthday,
  });

  factory SignUpRequest.fromJson(Map<String, dynamic> json) => _$SignUpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}