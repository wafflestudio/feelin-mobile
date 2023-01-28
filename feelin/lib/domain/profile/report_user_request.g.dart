// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportUserRequest _$ReportUserRequestFromJson(Map<String, dynamic> json) =>
    ReportUserRequest(
      reportType: json['reportType'] as String,
      username: json['username'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$ReportUserRequestToJson(ReportUserRequest instance) =>
    <String, dynamic>{
      'reportType': instance.reportType,
      'username': instance.username,
      'description': instance.description,
    };
