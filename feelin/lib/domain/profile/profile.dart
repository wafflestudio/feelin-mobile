import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile{
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "username")
  String username;

  @JsonKey(name: "image")
  String? image;

  @JsonKey(name: "introduction")
  String? introduction;

  @JsonKey(name: "countPosts")
  int? countPosts;

  @JsonKey(name: "name")
  String? name;

  Profile({
    required this.id,
    required this.username,
    this.image,
    this.introduction,
    this.countPosts,
    this.name,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}