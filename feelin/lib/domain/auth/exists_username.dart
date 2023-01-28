import 'package:json_annotation/json_annotation.dart';

part 'exists_username.g.dart';

@JsonSerializable()
class ExistsUsername{
  @JsonKey(name: "existUsername")
  bool existsUsername;

  ExistsUsername({
    required this.existsUsername,
  });

  factory ExistsUsername.fromJson(Map<String, dynamic> json) => _$ExistsUsernameFromJson(json);

  Map<String, dynamic> toJson() => _$ExistsUsernameToJson(this);
}