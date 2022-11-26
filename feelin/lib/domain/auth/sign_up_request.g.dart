// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequest _$SignUpRequestFromJson(Map<String, dynamic> json) =>
    SignUpRequest(
      email: json['email'] as String,
      password: json['password'] as String,
      lastName: json['lastName'] as String,
      firstName: json['firstName'] as String,
      username: json['username'] as String,
      phoneNumber: json['phoneNumber'] as String,
      birthday: json['birth'] as String,
    );

Map<String, dynamic> _$SignUpRequestToJson(SignUpRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'username': instance.username,
      'phoneNumber': instance.phoneNumber,
      'birth': instance.birthday,
    };
