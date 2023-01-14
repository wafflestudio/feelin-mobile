part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.myProfileRequest() = _MyProfileRequest;
  const factory ProfileEvent.profileRequest(int id) = _ProfileRequest;
  const factory ProfileEvent.profileChanged(Profile profile) = _ProfileChanged;
  const factory ProfileEvent.myPageRequest(int page) = _MyPageRequest;
  const factory ProfileEvent.pageRequest(int page, int id) = _PageRequest;
  const factory ProfileEvent.followRequest() = _FollowRequest;
  const factory ProfileEvent.unFollowRequest() = _UnFollowRequest;
  const factory ProfileEvent.resetRequest() = _ResetRequest;
}