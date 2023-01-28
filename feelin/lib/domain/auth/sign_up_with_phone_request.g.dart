// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_with_phone_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpWithPhoneRequest _$SignUpWithPhoneRequestFromJson(
        Map<String, dynamic> json) =>
    SignUpWithPhoneRequest(
      phoneNumber: json['phoneNumber'] as String,
      countryCode: json['countryCode'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
      birthday: json['birthDate'] as String,
    );

Map<String, dynamic> _$SignUpWithPhoneRequestToJson(
        SignUpWithPhoneRequest instance) =>
    <String, dynamic>{
      'password': instance.password,
      'name': instance.name,
      'username': instance.username,
      'birthDate': instance.birthday,
      'countryCode': instance.countryCode,
      'phoneNumber': instance.phoneNumber,
    };
