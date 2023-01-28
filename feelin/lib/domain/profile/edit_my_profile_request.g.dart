// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_my_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditMyProfileRequest _$EditMyProfileRequestFromJson(
        Map<String, dynamic> json) =>
    EditMyProfileRequest(
      name: json['name'] as String,
      username: json['username'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      introduction: json['introduction'] as String,
    );

Map<String, dynamic> _$EditMyProfileRequestToJson(
        EditMyProfileRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'profileImageUrl': instance.profileImageUrl,
      'introduction': instance.introduction,
    };
