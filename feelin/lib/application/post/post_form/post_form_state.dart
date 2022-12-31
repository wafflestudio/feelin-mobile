part of 'post_form_bloc.dart';

@freezed
class PostFormState with _$PostFormState {
  const factory PostFormState({
    required PlaylistUrl playlistUrl,
    required Option<Either<PostFailure, Playlist>> fetchFailureOrSuccessOption,
    required bool isFetching,
    required bool isSuccessfulFetch,
    required NotEmptyString title,
    required ContentString content,
    required PlaylistPreview playlistPreview,
    required Playlist playlist,
    required Option<Either<PostFailure, Unit>> postFailureOrSuccessOption,
    required bool isSubmitting,
  }) = _PostFormState;
  factory PostFormState.initial() => PostFormState(
      playlistUrl: PlaylistUrl(''),
      fetchFailureOrSuccessOption: none(),
      isFetching: false,
      isSuccessfulFetch: false,
      title: NotEmptyString(''),
      content: ContentString(''),
      playlistPreview: PlaylistPreview(id: '-1', thumbnail: ''),
      playlist: Playlist(),
      postFailureOrSuccessOption: none(),
      isSubmitting: false,
  );
}