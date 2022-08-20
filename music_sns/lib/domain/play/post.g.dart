// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as int,
      writer: json['writer'] as String,
      profile: json['profile'] as String,
      content: json['content'] as String,
      playlist: Playlist.fromJson(json['playlist'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'writer': instance.writer,
      'profile': instance.profile,
      'content': instance.content,
      'playlist': instance.playlist,
    };
