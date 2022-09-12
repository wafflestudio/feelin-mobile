part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    required Option<Either<ProfileFailure, Pageable>> loadFailureOrSuccessOption,
    required List<PostThumbnail> posts,
    required bool isLoading,
    required bool isLast,
  }) = _ProfileState;
  factory ProfileState.initial() => ProfileState(
    loadFailureOrSuccessOption: none(),
    posts: [],
    isLoading: false,
    isLast: false,
  );
}