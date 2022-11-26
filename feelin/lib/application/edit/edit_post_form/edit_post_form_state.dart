part of 'edit_post_form_bloc.dart';

@freezed
class EditPostFormState with _$EditPostFormState {
  const factory EditPostFormState({
    required NotEmptyString title,
    required ContentString content,
    required Option<Either<PostFailure, Unit>> editFailureOrSuccessOption,
    required bool isSubmitting,
  }) = _PostDetailFormState;
  factory EditPostFormState.initial() => EditPostFormState(
    title: NotEmptyString(''),
    content: ContentString(''),
    editFailureOrSuccessOption: none(),
    isSubmitting: false,
  );
}