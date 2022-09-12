part of 'post_detail_form_bloc.dart';

@freezed
class PostDetailFormEvent with _$PostDetailFormEvent {
  const factory PostDetailFormEvent.titleChanged(String titleStr) = _TitleChanged;
  const factory PostDetailFormEvent.contentChanged(String contentStr) = _ContentChanged;
  const factory PostDetailFormEvent.playlistPreviewChanged(PlaylistPreview playlistPreview) = _PlaylistPreviewChanged;
  const factory PostDetailFormEvent.submitted() = _Submitted;
}