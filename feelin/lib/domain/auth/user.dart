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

  @JsonKey(name: "firstName")
  String? firstName;

  @JsonKey(name: "lastName")
  String? lastName;

  @JsonKey(name: "birth")
  String? birthday;

  User({
    required this.id,
    required this.username,
    this.email,
    this.phoneNumber,
    this.birthday,
    this.lastName,
    this.firstName,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}