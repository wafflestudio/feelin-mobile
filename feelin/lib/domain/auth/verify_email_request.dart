import 'package:json_annotation/json_annotation.dart';

part 'verify_email_request.g.dart';

@JsonSerializable()
class VerifyEmailRequest{
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "code")
  String code;

  VerifyEmailRequest({
    required this.email,
    required this.code,
  });

  factory VerifyEmailRequest.fromJson(Map<String, dynamic> json) => _$VerifyEmailRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyEmailRequestToJson(this);
}