// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spotify_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpotifyRequest _$SpotifyRequestFromJson(Map<String, dynamic> json) =>
    SpotifyRequest(
      code: json['code'] as String,
      state: json['state'] as String,
      error: json['error'] as String,
    );

Map<String, dynamic> _$SpotifyRequestToJson(SpotifyRequest instance) =>
    <String, dynamic>{
      'code': instance.code,
      'state': instance.state,
      'error': instance.error,
    };
