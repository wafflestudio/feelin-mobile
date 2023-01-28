part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    required Option<Either<ProfileFailure, Page>> loadFailureOrSuccessOption,
    required Option<Either<ProfileFailure, Unit>> reportFailureOrSuccessOption,
    required List<Post> posts,
    required Profile profile,
    required bool isLoading,
    required bool isLast,
    required bool isLoaded,
    required bool isFollowed,
    required String? cursor,
  }) = _ProfileState;
  factory ProfileState.initial() => ProfileState(
    loadFailureOrSuccessOption: none(),
    reportFailureOrSuccessOption: none(),
    posts: [],
    profile: Profile(id: '', username: '', profileImage: ''),
    isLoading: true,
    isLast: false,
    isLoaded: false,
    isFollowed: false,
    cursor: null,
  );
}