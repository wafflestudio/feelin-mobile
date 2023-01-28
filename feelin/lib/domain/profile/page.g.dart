// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Page _$PageFromJson(Map<String, dynamic> json) => Page(
      content: (json['content'] as List<dynamic>)
          .map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
      last: json['last'] as bool? ?? true,
    );

Map<String, dynamic> _$PageToJson(Page instance) => <String, dynamic>{
      'content': instance.content,
      'last': instance.last,
    };
