// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_post_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePostRequest _$CreatePostRequestFromJson(Map<String, dynamic> json) =>
    CreatePostRequest(
      title: json['title'] as String,
      content: json['content'] as String,
      playlistPreview:
          PlaylistPreview.fromJson(json['playlist'] as Map<String, dynamic>),
      originalVendorPlaylist: json['originalVendorPlaylist'] == null
          ? null
          : OriginalVendorPlaylist.fromJson(
              json['originalVendorPlaylist'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreatePostRequestToJson(CreatePostRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'playlist': instance.playlistPreview,
      'originalVendorPlaylist': instance.originalVendorPlaylist,
    };
