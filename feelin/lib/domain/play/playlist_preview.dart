import 'package:json_annotation/json_annotation.dart';

part 'playlist_preview.g.dart';

@JsonSerializable()
class PlaylistPreview{
  @JsonKey(name: "id")
  String id;

  @JsonKey(name: "thumbnail")
  String thumbnail;

  @JsonKey(name: "order")
  String order;

  @JsonKey(name: "length")
  int length;

  PlaylistPreview({
    required this.id,
    required this.thumbnail,
    this.order = '',
    this.length = 0,
  });

  factory PlaylistPreview.fromJson(Map<String, dynamic> json) => _$PlaylistPreviewFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistPreviewToJson(this);
}