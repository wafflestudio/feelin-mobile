// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_with_email_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpWithEmailRequest _$SignUpWithEmailRequestFromJson(
        Map<String, dynamic> json) =>
    SignUpWithEmailRequest(
      email: json['email'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
      birthday: json['birthDate'] as String,
    );

Map<String, dynamic> _$SignUpWithEmailRequestToJson(
        SignUpWithEmailRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'username': instance.username,
      'birthDate': instance.birthday,
    };
