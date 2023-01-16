import 'package:json_annotation/json_annotation.dart';
import 'package:music_sns/domain/profile/profile.dart';

part 'page_user.g.dart';

@JsonSerializable()
class PageUser{
  @JsonKey(name: "content")
  List<Profile> content;

  @JsonKey(name: 'last')
  bool last;

  PageUser({
    required this.content,
    this.last = true,
  });

  factory PageUser.fromJson(Map<String, dynamic> json) => _$PageUserFromJson(json);

  Map<String, dynamic> toJson() => _$PageUserToJson(this);
}