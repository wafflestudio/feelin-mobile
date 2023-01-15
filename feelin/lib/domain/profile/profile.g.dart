// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      id: json['id'] as int,
      username: json['username'] as String,
      image: json['image'] as String?,
      introduction: json['introduction'] as String?,
      countPosts: json['countPosts'] as int?,
      name: json['name'] as String?,
      followerCount: json['countFollowers'] as int?,
      followingCount: json['countFollowings'] as int?,
      isFollowed: json['isFollowing'] as bool?,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'image': instance.image,
      'introduction': instance.introduction,
      'countPosts': instance.countPosts,
      'name': instance.name,
      'countFollowers': instance.followerCount,
      'countFollowings': instance.followingCount,
      'isFollowing': instance.isFollowed,
    };
