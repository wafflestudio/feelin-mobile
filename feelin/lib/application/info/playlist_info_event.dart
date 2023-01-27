part of 'playlist_info_bloc.dart';

@freezed
class PlaylistInfoEvent with _$PlaylistInfoEvent {
  const factory PlaylistInfoEvent.loadRequest(String postId) = _LoadRequest;
  const factory PlaylistInfoEvent.deleteRequest(String postId) = _DeleteRequest;
  const factory PlaylistInfoEvent.likeRequest() = _LikeRequest;
  const factory PlaylistInfoEvent.unlikeRequest() = _UnlikeRequest;
  const factory PlaylistInfoEvent.saveRequest(String vendorId) = _SaveRequest;
}