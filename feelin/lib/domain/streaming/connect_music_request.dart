import 'package:json_annotation/json_annotation.dart';

part 'connect_music_request.g.dart';

@JsonSerializable()
class ConnectMusicRequest{

  @JsonKey(name: "accessToken")
  String accessToken;

  @JsonKey(name: "refreshToken")
  String? refreshToken;

  @JsonKey(name: "id")
  String id;


  ConnectMusicRequest({
    required this.accessToken,
    this.refreshToken,
    required this.id,
  });

  factory ConnectMusicRequest.fromJson(Map<String, dynamic> json) => _$ConnectMusicRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ConnectMusicRequestToJson(this);
}