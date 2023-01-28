import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile{
  @JsonKey(name: "id")
  String id;

  @JsonKey(name: "username")
  String username;

  @JsonKey(name: "profileImageUrl")
  String? profileImage;

  @JsonKey(name: "introduction")
  String? introduction;

  @JsonKey(name: "countPosts")
  int? countPosts;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "countFollowers")
  int? followerCount;

  @JsonKey(name: "countFollowings")
  int? followingCount;

  @JsonKey(name: "isFollowing")
  bool? isFollowed;

  Profile({
    required this.id,
    required this.username,
    this.profileImage,
    this.introduction,
    this.countPosts,
    this.name,
    this.followerCount,
    this.followingCount,
    this.isFollowed,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}