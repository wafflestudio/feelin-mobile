part of 'blocked_user_bloc.dart';

@freezed
class BlockedUserEvent with _$BlockedUserEvent {
  const factory BlockedUserEvent.loadRequest() = _LoadRequest;
  const factory BlockedUserEvent.resetRequest() = _ResetRequest;
  const factory BlockedUserEvent.unblockRequest(int index,) = _UnBlockRequest;
}