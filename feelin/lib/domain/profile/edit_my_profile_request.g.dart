// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_my_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditMyProfileRequest _$EditMyProfileRequestFromJson(
        Map<String, dynamic> json) =>
    EditMyProfileRequest(
      username: json['username'] as String,
      image: json['image'] as String,
      introduction: json['introduction'] as String,
    );

Map<String, dynamic> _$EditMyProfileRequestToJson(
        EditMyProfileRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'image': instance.image,
      'introduction': instance.introduction,
    };
