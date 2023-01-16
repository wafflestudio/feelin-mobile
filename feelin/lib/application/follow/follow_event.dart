part of 'follow_bloc.dart';

@freezed
class FollowEvent with _$FollowEvent {
  const factory FollowEvent.loadFollowingsRequest(int id) = _LoadFollowingsRequest;
  const factory FollowEvent.loadFollowersRequest(int id) = _LoadFollowersRequest;
  const factory FollowEvent.resetRequest() = _ResetRequest;
}