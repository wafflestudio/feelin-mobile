// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pageable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pageable _$PageableFromJson(Map<String, dynamic> json) => Pageable(
      content: (json['content'] as List<dynamic>)
          .map((e) => PostThumbnail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PageableToJson(Pageable instance) => <String, dynamic>{
      'content': instance.content,
    };
