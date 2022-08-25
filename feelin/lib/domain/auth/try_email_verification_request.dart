import 'package:json_annotation/json_annotation.dart';

part 'try_email_verification_request.g.dart';

@JsonSerializable()
class TryEmailVerificationRequest{
  @JsonKey(name: "email")
  String email;

  TryEmailVerificationRequest({
    required this.email,
  });

  factory TryEmailVerificationRequest.fromJson(Map<String, dynamic> json) => _$TryEmailVerificationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TryEmailVerificationRequestToJson(this);
}