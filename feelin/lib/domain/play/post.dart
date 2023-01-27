import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:music_sns/domain/play/album.dart';
import 'package:music_sns/domain/play/artist.dart';
import 'package:music_sns/domain/play/playlist.dart';

import '../profile/profile.dart';
import 'track.dart';

part 'post.g.dart';

@JsonSerializable()
class Post{
  @JsonKey(name:"id")
  String id;

  @JsonKey(name:"user")
  Profile? writer;

  @JsonKey(name:"title")
  String title;

  @JsonKey(name:"content")
  String content;

  @JsonKey(name:"playlist")
  Playlist playlist;

  @JsonKey(name:"doesLike")
  bool? isLiked;

  @JsonKey(name:"likes")
  int? likeCount;

  @JsonKey(name:"thumbnail")
  String? tempThumbnail;

  //@JsonKey(name:"trackPreview")
  List<Track>? trackPreview = [
    Track(id: '', title: 'I Still Love You', artists: [Artist(id: '', name: '나얼')], album: Album(id: '', title: '', thumbnail: 'https://image.bugsm.co.kr/album/images/1000/40830/4083027.jpg')),
    Track(id: '', title: 'My Sunny Day', artists: [Artist(id: '', name: 'Ted Fresco'),Artist(id: '', name: 'Lyn Lapid')], album: Album(id: '', title: '', thumbnail: 'https://image.bugsm.co.kr/album/images/1000/164792/16479261.jpg')),
    Track(id: '', title: '흔들리는 꽃들 속에서 네 샴푸향이 느껴진거야', artists: [Artist(id: '', name: '장범준')], album: Album(id: '', title: '', thumbnail: 'https://image.bugsm.co.kr/album/images/1000/202726/20272602.jpg')),
  ];

  Post({
    required this.id,
    this.writer,
    required this.title,
    required this.content,
    required this.playlist,
    this.isLiked,
    this.likeCount = 0,
    this.tempThumbnail,
    //this.trackPreview,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);

  Post clone(){
    final jsonResponse = json.decode(json.encode(this));
        return Post.fromJson(jsonResponse as Map<String, dynamic>);
  }
}