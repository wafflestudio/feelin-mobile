// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Track _$TrackFromJson(Map<String, dynamic> json) => Track(
      id: json['id'] as int,
      title: json['title'] as String,
      artists:
          (json['artists'] as List<dynamic>).map((e) => e as String).toList(),
      album: json['album'] as String,
    );

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'artists': instance.artists,
      'album': instance.album,
    };
