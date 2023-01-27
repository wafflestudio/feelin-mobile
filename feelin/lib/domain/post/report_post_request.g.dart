// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_post_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportPostRequest _$ReportPostRequestFromJson(Map<String, dynamic> json) =>
    ReportPostRequest(
      reportType: json['reportType'] as String,
      username: json['username'] as String,
      description: json['description'] as String,
      post: Post.fromJson(json['post'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReportPostRequestToJson(ReportPostRequest instance) =>
    <String, dynamic>{
      'reportType': instance.reportType,
      'username': instance.username,
      'description': instance.description,
      'post': instance.post,
    };
