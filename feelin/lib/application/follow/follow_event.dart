part of 'follow_bloc.dart';

@freezed
class FollowEvent with _$FollowEvent {
  const factory FollowEvent.loadFollowingsRequest(String id) = _LoadFollowingsRequest;
  const factory FollowEvent.loadFollowersRequest(String id) = _LoadFollowersRequest;
  const factory FollowEvent.loadLikesRequest(String id) = _LoadLikesRequest;
  const factory FollowEvent.resetRequest() = _ResetRequest;
  const factory FollowEvent.followRequest(int index,) = _FollowRequest;
  const factory FollowEvent.unfollowRequest(int index,) = _UnFollowRequest;
}