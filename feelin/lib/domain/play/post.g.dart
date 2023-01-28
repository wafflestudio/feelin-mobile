// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as String,
      writer: json['user'] == null
          ? null
          : Profile.fromJson(json['user'] as Map<String, dynamic>),
      title: json['title'] as String,
      content: json['content'] as String,
      playlist: Playlist.fromJson(json['playlist'] as Map<String, dynamic>),
      isLiked: json['doesLike'] as bool?,
      likeCount: json['likes'] as int? ?? 0,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.writer,
      'title': instance.title,
      'content': instance.content,
      'playlist': instance.playlist,
      'doesLike': instance.isLiked,
      'likes': instance.likeCount,
    };
