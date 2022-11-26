part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    required Option<Either<ProfileFailure, Pageable>> loadFailureOrSuccessOption,
    required List<Post> posts,
    required Profile profile,
    required bool isLoading,
    required bool isLast,
    required bool isLoaded,
  }) = _ProfileState;
  factory ProfileState.initial() => ProfileState(
    loadFailureOrSuccessOption: none(),
    posts: [],
    profile: Profile(id: -1, username: '', image: ''),
    isLoading: true,
    isLast: false,
    isLoaded: false,
  );
}