part of 'post_detail_form_bloc.dart';

@freezed
class PostDetailFormState with _$PostDetailFormState {
  const factory PostDetailFormState({
    required NotEmptyString title,
    required ContentString content,
    required PlaylistPreview playlistPreview,
    required Option<Either<PostFailure, Unit>> postFailureOrSuccessOption,
    required bool isSubmitting,
  }) = _PostDetailFormState;
  factory PostDetailFormState.initial() => PostDetailFormState(
    title: NotEmptyString(''),
    content: ContentString(''),
    playlistPreview: PlaylistPreview(id: '-1', thumbnail: ''),
    postFailureOrSuccessOption: none(),
    isSubmitting: false,
  );
}