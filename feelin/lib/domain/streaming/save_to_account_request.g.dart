// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_to_account_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveToAccountRequest _$SaveToAccountRequestFromJson(
        Map<String, dynamic> json) =>
    SaveToAccountRequest(
      title: json['title'] as String,
      content: json['description'] as String,
    );

Map<String, dynamic> _$SaveToAccountRequestToJson(
        SaveToAccountRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.content,
    };
