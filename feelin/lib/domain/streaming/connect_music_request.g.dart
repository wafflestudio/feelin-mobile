// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connect_music_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConnectMusicRequest _$ConnectMusicRequestFromJson(Map<String, dynamic> json) =>
    ConnectMusicRequest(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String?,
      id: json['id'] as String,
    );

Map<String, dynamic> _$ConnectMusicRequestToJson(
        ConnectMusicRequest instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'id': instance.id,
    };
