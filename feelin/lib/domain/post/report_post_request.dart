import 'package:json_annotation/json_annotation.dart';

import '../play/post.dart';

part 'report_post_request.g.dart';

@JsonSerializable()
class ReportPostRequest{
  @JsonKey(name: "reportType")
  String reportType;
  @JsonKey(name: "username")
  String username;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "post")
  Post post;

  ReportPostRequest({
    required this.reportType,
    required this.username,
    required this.description,
    required this.post,
  });

  factory ReportPostRequest.fromJson(Map<String, dynamic> json) => _$ReportPostRequestFromJson(json);

  Map <String, dynamic> toJson() => _$ReportPostRequestToJson(this);
}