part of 'playlist_info_bloc.dart';

@freezed
class PlaylistInfoState with _$PlaylistInfoState {
  const factory PlaylistInfoState({
    required Option<Either<ExplorePostFailure, Post>> loadFailureOrSuccessOption,
    required Option<Either<ExplorePostFailure, Unit>> deleteFailureOrSuccessOption,
    required Option<Either<ExplorePostFailure, RedirectUrl>> saveFailureOrSuccessOption,
    required Option<Either<ExplorePostFailure, Unit>> reportFailureOrSuccessOption,
    required Option<Either<BlockFailure, Unit>> blockFailureOrSuccessOption,
    required Post post,
    required bool isLoading,
    required bool isSaving,
    required bool isLiked,
    required bool isRestricted,
  }) = _PlaylistInfoState;
  factory PlaylistInfoState.initial() => PlaylistInfoState(
    loadFailureOrSuccessOption: none(),
    deleteFailureOrSuccessOption: none(),
    saveFailureOrSuccessOption: none(),
    reportFailureOrSuccessOption: none(),
    blockFailureOrSuccessOption: none(),
    post: Post(id: '', writer: Profile(id: '', username: '', profileImage: ''),title: '', content: '', playlist: Playlist(title: '', tracks: [])),
    isLoading: false,
    isSaving: false,
    isLiked: false,
    isRestricted: false,
  );
}