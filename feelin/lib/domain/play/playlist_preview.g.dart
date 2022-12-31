// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaylistPreview _$PlaylistPreviewFromJson(Map<String, dynamic> json) =>
    PlaylistPreview(
      id: json['id'] as String,
      thumbnail: json['thumbnail'] as String,
      order: json['order'] as String? ?? '',
      length: json['length'] as int? ?? 0,
    );

Map<String, dynamic> _$PlaylistPreviewToJson(PlaylistPreview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'thumbnail': instance.thumbnail,
      'order': instance.order,
      'length': instance.length,
    };
