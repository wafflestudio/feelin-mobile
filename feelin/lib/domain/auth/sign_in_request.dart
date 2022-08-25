import 'package:json_annotation/json_annotation.dart';

part 'sign_in_request.g.dart';

@JsonSerializable()
class SignInRequest{
  @JsonKey(name: "account")
  String account;
  @JsonKey(name: "password")
  String password;

  SignInRequest({
    required this.account,
    required this.password,
});

  factory SignInRequest.fromJson(Map<String, dynamic> json) => _$SignInRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignInRequestToJson(this);
}