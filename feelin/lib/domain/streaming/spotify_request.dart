import 'package:json_annotation/json_annotation.dart';

part 'spotify_request.g.dart';

@JsonSerializable()
class SpotifyRequest{

  @JsonKey(name: "code")
  String code;

  @JsonKey(name: "state")
  String state;

  @JsonKey(name: "error")
  String error;


  SpotifyRequest({
    required this.code,
    required this.state,
    required this.error,
  });

  factory SpotifyRequest.fromJson(Map<String, dynamic> json) => _$SpotifyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SpotifyRequestToJson(this);
}