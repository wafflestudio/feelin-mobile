import 'package:json_annotation/json_annotation.dart';

part 'main_track.g.dart';

@JsonSerializable()
class MainTrack{

  @JsonKey(name: "title")
  String title;

  @JsonKey(name: "artists")
  String artists;

  @JsonKey(name: "thumbnail")
  String thumbnail;

  MainTrack({
    required this.title,
    required this.artists,
    required this.thumbnail,
  });

  factory MainTrack.fromJson(Map<String, dynamic> json) => _$MainTrackFromJson(json);

  Map<String, dynamic> toJson() => _$MainTrackToJson(this);
}