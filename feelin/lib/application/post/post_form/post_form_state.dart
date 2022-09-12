part of 'post_form_bloc.dart';

@freezed
class PostFormState with _$PostFormState {
  const factory PostFormState({
    required PlaylistUrl playlistUrl,
    required Option<Either<PostFailure, Playlist>> postFailureOrSuccessOption,
    required bool isSubmitting,
    required bool isNavigated
  }) = _PostFormState;
  factory PostFormState.initial() => PostFormState(
      playlistUrl: PlaylistUrl(''),
      postFailureOrSuccessOption: none(),
      isSubmitting: false,
      isNavigated: false,
  );
}