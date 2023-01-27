// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'try_phone_verification_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TryPhoneVerificationRequest _$TryPhoneVerificationRequestFromJson(
        Map<String, dynamic> json) =>
    TryPhoneVerificationRequest(
      countryCode: json['countryCode'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$TryPhoneVerificationRequestToJson(
        TryPhoneVerificationRequest instance) =>
    <String, dynamic>{
      'countryCode': instance.countryCode,
      'phoneNumber': instance.phoneNumber,
    };
