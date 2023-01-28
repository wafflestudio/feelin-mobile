import 'package:json_annotation/json_annotation.dart';

part 'sign_up_with_phone_request.g.dart';

@JsonSerializable()
class SignUpWithPhoneRequest {
  @JsonKey(name: "password")
  String password;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "username")
  String username;
  @JsonKey(name: "birthDate")
  String birthday;
  @JsonKey(name: "countryCode")
  String countryCode;
  @JsonKey(name: "phoneNumber")
  String phoneNumber;

  SignUpWithPhoneRequest({
    required this.phoneNumber,
    required this.countryCode,
    required this.password,
    required this.name,
    required this.username,
    required this.birthday,
  });

  factory SignUpWithPhoneRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpWithPhoneRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpWithPhoneRequestToJson(this);
}
