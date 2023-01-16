part of 'follow_bloc.dart';

@freezed
class FollowState with _$FollowState {
  const factory FollowState({
    required bool isLoading,
    required Option<Either<ProfileFailure, PageUser>> loadFailureOrSuccessOption,
    required List<Profile> users,
    required bool isLast,
    required String? cursor,
  }) = _FollowState;
  factory FollowState.initial() => FollowState(
    isLoading: false,
    loadFailureOrSuccessOption: none(),
    users: [],
    isLast: false,
    cursor: null,
  );
}