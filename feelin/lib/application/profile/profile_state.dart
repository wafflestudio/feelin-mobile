part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    required Option<Either<ProfileFailure, Page>> loadFailureOrSuccessOption,
    required Option<Either<ProfileFailure, Unit>> reportFailureOrSuccessOption,
    required Option<Either<BlockFailure, Unit>> blockFailureOrSuccessOption,
    required List<Post> posts,
    required Profile profile,
    required bool isLoading,
    required bool isLoadingPage,
    required bool isLast,
    required bool isLoaded,
    required bool isFollowed,
    required String? cursor,
    required bool isRestricted,
  }) = _ProfileState;
  factory ProfileState.initial() => ProfileState(
    loadFailureOrSuccessOption: none(),
    reportFailureOrSuccessOption: none(),
    blockFailureOrSuccessOption: none(),
    posts: [],
    profile: Profile(id: '', username: '', profileImage: ''),
    isLoading: true,
    isLoadingPage: false,
    isLast: false,
    isLoaded: false,
    isFollowed: false,
    cursor: null,
    isRestricted: false,
  );
}