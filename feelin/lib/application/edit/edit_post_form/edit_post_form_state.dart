part of 'edit_post_form_bloc.dart';

@freezed
class EditPostFormState with _$EditPostFormState {
  const factory EditPostFormState({
    required String postId,
    required NotEmptyString title,
    required ContentString content,
    required PlaylistPreview playlistPreview,
    required Option<Either<PostFailure, Unit>> editFailureOrSuccessOption,
    required bool isSubmitting,
  }) = _PostDetailFormState;
  factory EditPostFormState.initial() => EditPostFormState(
    postId: '',
    title: NotEmptyString(''),
    content: ContentString(''),
    playlistPreview: PlaylistPreview(id: '', thumbnail: ''),
    editFailureOrSuccessOption: none(),
    isSubmitting: false,
  );
}