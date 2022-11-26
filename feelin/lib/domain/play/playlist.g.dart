// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Playlist _$PlaylistFromJson(Map<String, dynamic> json) => Playlist(
      title: json['title'] as String? ?? '',
      tracks: (json['tracks'] as List<dynamic>?)
          ?.map((e) => Track.fromJson(e as Map<String, dynamic>))
          .toList(),
      playlistPreview: json['preview'] == null
          ? null
          : PlaylistPreview.fromJson(json['preview'] as Map<String, dynamic>),
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$PlaylistToJson(Playlist instance) => <String, dynamic>{
      'title': instance.title,
      'tracks': instance.tracks,
      'preview': instance.playlistPreview,
      'thumbnail': instance.thumbnail,
    };
