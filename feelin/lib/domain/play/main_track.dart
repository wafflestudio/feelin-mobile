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

  @JsonKey(name: "isExplicit")
  bool isExplicit;

  MainTrack({
    required this.title,
    required this.artists,
    required this.thumbnail,
    this.isExplicit = false,
  });

  factory MainTrack.fromJson(Map<String, dynamic> json) => _$MainTrackFromJson(json);

  Map<String, dynamic> toJson() => _$MainTrackToJson(this);
}