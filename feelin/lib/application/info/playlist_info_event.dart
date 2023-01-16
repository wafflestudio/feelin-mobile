part of 'playlist_info_bloc.dart';

@freezed
class PlaylistInfoEvent with _$PlaylistInfoEvent {
  const factory PlaylistInfoEvent.loadRequest(int postId) = _LoadRequest;
  const factory PlaylistInfoEvent.deleteRequest(int postId) = _DeleteRequest;
  const factory PlaylistInfoEvent.likeRequest() = _LikeRequest;
  const factory PlaylistInfoEvent.unlikeRequest() = _UnlikeRequest;
}