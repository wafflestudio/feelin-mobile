// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_playlist_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostPlaylistRequest _$PostPlaylistRequestFromJson(Map<String, dynamic> json) =>
    PostPlaylistRequest(
      url: json['playlistUrl'] as String,
    );

Map<String, dynamic> _$PostPlaylistRequestToJson(
        PostPlaylistRequest instance) =>
    <String, dynamic>{
      'playlistUrl': instance.url,
    };
