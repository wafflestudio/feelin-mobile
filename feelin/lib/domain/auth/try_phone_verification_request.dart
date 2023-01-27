import 'package:json_annotation/json_annotation.dart';

part 'try_phone_verification_request.g.dart';

@JsonSerializable()
class TryPhoneVerificationRequest{
  @JsonKey(name: "countryCode")
  String countryCode;
  @JsonKey(name: "phoneNumber")
  String phoneNumber;

  TryPhoneVerificationRequest({
    required this.countryCode,
    required this.phoneNumber,
  });

  factory TryPhoneVerificationRequest.fromJson(Map<String, dynamic> json) => _$TryPhoneVerificationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TryPhoneVerificationRequestToJson(this);
}