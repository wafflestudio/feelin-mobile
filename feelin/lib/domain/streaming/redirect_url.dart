import 'package:json_annotation/json_annotation.dart';

part 'redirect_url.g.dart';

@JsonSerializable()
class RedirectUrl{

  @JsonKey(name: 'url')
  String url;

  RedirectUrl({
    required this.url,
  });

  factory RedirectUrl.fromJson(Map<String, dynamic> json) => _$RedirectUrlFromJson(json);

  Map<String, dynamic> toJson() => _$RedirectUrlToJson(this);
}