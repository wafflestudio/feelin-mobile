part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.myProfileRequest() = _MyProfileRequest;
  const factory ProfileEvent.reMyProfileRequest() = _ReMyProfileRequest;
  const factory ProfileEvent.profileRequest(String id) = _ProfileRequest;
  const factory ProfileEvent.reProfileRequest(String id) = _ReProfileRequest;
  const factory ProfileEvent.profileChanged(Profile profile) = _ProfileChanged;
  const factory ProfileEvent.myPageRequest() = _MyPageRequest;
  const factory ProfileEvent.pageRequest(String id) = _PageRequest;
  const factory ProfileEvent.followRequest() = _FollowRequest;
  const factory ProfileEvent.unFollowRequest() = _UnFollowRequest;
  const factory ProfileEvent.resetRequest() = _ResetRequest;
  const factory ProfileEvent.removeItem(int index) = _RemoveItem;
  const factory ProfileEvent.reportRequest(String reportType, description) = _ReportRequest;
  const factory ProfileEvent.blockRequest() = _BlockRequest;
  const factory ProfileEvent.resetStateRequest() = _ResetStateRequest;
}