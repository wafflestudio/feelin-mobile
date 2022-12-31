part of 'post_form_bloc.dart';

@freezed
class PostFormEvent with _$PostFormEvent {
  const factory PostFormEvent.urlChanged(String urlStr) = _UrlChanged;
  const factory PostFormEvent.resetFetch() = _ResetFetch;
  const factory PostFormEvent.submitted() = _Submitted;
  const factory PostFormEvent.fetchRequested() = _FetchRequested;
  const factory PostFormEvent.titleChanged(String titleStr) = _TitleChanged;
  const factory PostFormEvent.contentChanged(String contentStr) = _ContentChanged;
  const factory PostFormEvent.playlistPreviewChanged(PlaylistPreview playlistPreview) = _PlaylistPreviewChanged;
}