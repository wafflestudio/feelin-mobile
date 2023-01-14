part of 'playlist_info_bloc.dart';

@freezed
class PlaylistInfoState with _$PlaylistInfoState {
  const factory PlaylistInfoState({
    required Option<Either<ExplorePostFailure, Post>> loadFailureOrSuccessOption,
    required Option<Either<ExplorePostFailure, Unit>> deleteFailureOrSuccessOption,
    required Post post,
    required bool isLoading,
  }) = _PlaylistInfoState;
  factory PlaylistInfoState.initial() => PlaylistInfoState(
    loadFailureOrSuccessOption: none(),
    deleteFailureOrSuccessOption: none(),
    post: Post(id: -1, writer: Profile(id: 0, username: '', image: ''),title: '', content: '', playlist: Playlist(title: '', tracks: [])),
    isLoading: false,
  );
}