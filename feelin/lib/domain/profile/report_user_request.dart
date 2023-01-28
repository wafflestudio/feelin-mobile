import 'package:json_annotation/json_annotation.dart';

part 'report_user_request.g.dart';

@JsonSerializable()
class ReportUserRequest{
  @JsonKey(name: "reportType")
  String reportType;
  @JsonKey(name: "username")
  String username;
  @JsonKey(name: "description")
  String description;

  ReportUserRequest({
    required this.reportType,
    required this.username,
    required this.description,
  });

  factory ReportUserRequest.fromJson(Map<String, dynamic> json) => _$ReportUserRequestFromJson(json);

  Map <String, dynamic> toJson() => _$ReportUserRequestToJson(this);
}