part of 'blocked_user_bloc.dart';

@freezed
class BlockedUserState with _$BlockedUserState {
  const factory BlockedUserState({
    required bool isLoading,
    required Option<Either<BlockFailure, PageUser>> loadFailureOrSuccessOption,
    required Option<Either<BlockFailure, Unit>> unblockFailureOrSuccessOption,
    required List<Profile> users,
    required bool isLast,
    required String? cursor,
  }) = _BlockedUserState;
  factory BlockedUserState.initial() => BlockedUserState(
    isLoading: false,
    loadFailureOrSuccessOption: none(),
    unblockFailureOrSuccessOption: none(),
    users: [],
    isLast: false,
    cursor: null,
  );
}