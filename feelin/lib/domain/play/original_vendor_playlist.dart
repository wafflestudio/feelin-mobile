import 'package:json_annotation/json_annotation.dart';

part 'original_vendor_playlist.g.dart';

@JsonSerializable()
class OriginalVendorPlaylist{

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: "vendor")
  String vendor;


  OriginalVendorPlaylist({
    required this.url,
    required this.vendor,
  });

  factory OriginalVendorPlaylist.fromJson(Map<String, dynamic> json) => _$OriginalVendorPlaylistFromJson(json);

  Map<String, dynamic> toJson() => _$OriginalVendorPlaylistToJson(this);
}