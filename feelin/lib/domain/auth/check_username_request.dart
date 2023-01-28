import 'package:json_annotation/json_annotation.dart';

part 'check_username_request.g.dart';

@JsonSerializable()
class CheckUsernameRequest{
  @JsonKey(name: "username")
  String username;

  CheckUsernameRequest({
    required this.username,
  });

  factory CheckUsernameRequest.fromJson(Map<String, dynamic> json) => _$CheckUsernameRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CheckUsernameRequestToJson(this);
}