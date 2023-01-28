import 'package:json_annotation/json_annotation.dart';

part 'edit_my_profile_request.g.dart';

@JsonSerializable()
class EditMyProfileRequest{

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "username")
  String username;

  @JsonKey(name: "profileImageUrl")
  String? profileImageUrl;

  @JsonKey(name: "introduction")
  String introduction;


  EditMyProfileRequest({
    required this.name,
    required this.username,
    required this.profileImageUrl,
    required this.introduction,
  });

  factory EditMyProfileRequest.fromJson(Map<String, dynamic> json) => _$EditMyProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EditMyProfileRequestToJson(this);
}