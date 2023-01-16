// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageUser _$PageUserFromJson(Map<String, dynamic> json) => PageUser(
      content: (json['content'] as List<dynamic>)
          .map((e) => Profile.fromJson(e as Map<String, dynamic>))
          .toList(),
      last: json['last'] as bool? ?? true,
    );

Map<String, dynamic> _$PageUserToJson(PageUser instance) => <String, dynamic>{
      'content': instance.content,
      'last': instance.last,
    };
