import 'package:json_annotation/json_annotation.dart';

part 'save_to_account_request.g.dart';

@JsonSerializable()
class SaveToAccountRequest{

  @JsonKey(name: "title")
  String title;

  @JsonKey(name: "description")
  String content;


  SaveToAccountRequest({
    required this.title,
    required this.content,
  });

  factory SaveToAccountRequest.fromJson(Map<String, dynamic> json) => _$SaveToAccountRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SaveToAccountRequestToJson(this);
}