part of 'post_form_bloc.dart';

@freezed
class PostFormEvent with _$PostFormEvent {
  const factory PostFormEvent.urlChanged(String urlStr) = _UrlChanged;
  const factory PostFormEvent.submitted() = _Submitted;
  const factory PostFormEvent.navigated() = _Navigated;
}