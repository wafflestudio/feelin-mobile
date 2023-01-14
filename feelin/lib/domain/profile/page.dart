import 'package:json_annotation/json_annotation.dart';
import 'package:music_sns/domain/play/post.dart';


part 'page.g.dart';

@JsonSerializable()
class Page{
  @JsonKey(name: "content")
  List<Post> content;

  @JsonKey(name: 'last')
  bool last;

  Page({
    required this.content,
    this.last = true,
  });

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);

  Map<String, dynamic> toJson() => _$PageToJson(this);
}