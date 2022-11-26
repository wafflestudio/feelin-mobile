part of 'edit_post_form_bloc.dart';

@freezed
class EditPostFormEvent with _$EditPostFormEvent {
  const factory EditPostFormEvent.titleChanged(String titleStr) = _TitleChanged;
  const factory EditPostFormEvent.contentChanged(String contentStr) = _ContentChanged;
  const factory EditPostFormEvent.submitted() = _Submitted;
}