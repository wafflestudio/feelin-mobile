import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User{
  @JsonKey(name: "id")
  String id;

  @JsonKey(name: "email")
  String? email;

  @JsonKey(name: "username")
  String username;

  @JsonKey(name: "phoneNumber")
  String? phoneNumber;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "birthDate")
  String? birthday;

  User({
    required this.id,
    required this.username,
    this.email,
    this.phoneNumber,
    this.birthday,
    this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}