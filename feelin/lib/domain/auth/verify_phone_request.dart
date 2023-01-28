import 'package:json_annotation/json_annotation.dart';

part 'verify_phone_request.g.dart';

@JsonSerializable()
class VerifyPhoneRequest{
  @JsonKey(name: "countryCode")
  String countryCode;
  @JsonKey(name: "phoneNumber")
  String phoneNumber;
  @JsonKey(name: "code")
  String code;

  VerifyPhoneRequest({
    required this.countryCode,
    required this.phoneNumber,
    required this.code,
  });

  factory VerifyPhoneRequest.fromJson(Map<String, dynamic> json) => _$VerifyPhoneRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyPhoneRequestToJson(this);
}