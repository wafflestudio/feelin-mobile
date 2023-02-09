// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Playlist _$PlaylistFromJson(Map<String, dynamic> json) => Playlist(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      tracks: (json['tracks'] as List<dynamic>?)
          ?.map((e) => Track.fromJson(e as Map<String, dynamic>))
          .toList(),
      playlistPreview: json['preview'] == null
          ? null
          : PlaylistPreview.fromJson(json['preview'] as Map<String, dynamic>),
      thumbnail: json['thumbnail'] as String?,
      mainTracks: (json['mainTracks'] as List<dynamic>?)
          ?.map((e) => MainTrack.fromJson(e as Map<String, dynamic>))
          .toList(),
      originalVendorPlaylist: json['originalVendorPlaylist'] == null
          ? null
          : OriginalVendorPlaylist.fromJson(
              json['originalVendorPlaylist'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaylistToJson(Playlist instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'tracks': instance.tracks,
      'preview': instance.playlistPreview,
      'thumbnail': instance.thumbnail,
      'mainTracks': instance.mainTracks,
      'originalVendorPlaylist': instance.originalVendorPlaylist,
    };
