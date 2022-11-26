part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.profileRequest() = _ProfileRequest;
  const factory ProfileEvent.profileChanged(Profile profile) = _ProfileChanged;
  const factory ProfileEvent.pageRequest(int page) = _PageRequest;
}