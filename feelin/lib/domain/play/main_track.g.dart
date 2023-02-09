// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainTrack _$MainTrackFromJson(Map<String, dynamic> json) => MainTrack(
      title: json['title'] as String,
      artists: json['artists'] as String,
      thumbnail: json['thumbnail'] as String,
      isExplicit: json['isExplicit'] as bool? ?? false,
    );

Map<String, dynamic> _$MainTrackToJson(MainTrack instance) => <String, dynamic>{
      'title': instance.title,
      'artists': instance.artists,
      'thumbnail': instance.thumbnail,
      'isExplicit': instance.isExplicit,
    };
