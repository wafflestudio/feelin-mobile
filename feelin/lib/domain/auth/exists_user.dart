import 'package:json_annotation/json_annotation.dart';

part 'exists_user.g.dart';

@JsonSerializable()
class ExistsUser{
  @JsonKey(name: "existUser")
  bool existsUser;

  ExistsUser({
    required this.existsUser,
  });

  factory ExistsUser.fromJson(Map<String, dynamic> json) => _$ExistsUserFromJson(json);

  Map<String, dynamic> toJson() => _$ExistsUserToJson(this);
}