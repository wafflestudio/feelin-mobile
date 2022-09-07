import 'package:json_annotation/json_annotation.dart';

part 'playlist_preview.g.dart';

@JsonSerializable()
class PlaylistPreview{
  @JsonKey(name: "id")
  String id;

  @JsonKey(name: "thumbnail")
  String thumbnail;

  PlaylistPreview({
    required this.id,
    required this.thumbnail,
  });

  factory PlaylistPreview.fromJson(Map<String, dynamic> json) => _$PlaylistPreviewFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistPreviewToJson(this);
}