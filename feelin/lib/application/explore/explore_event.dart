part of 'explore_bloc.dart';

@freezed
class ExploreEvent with _$ExploreEvent {
  const factory ExploreEvent.loadRequest() = _LoadRequest;
  const factory ExploreEvent.resetRequest() = _ResetRequest;
  const factory ExploreEvent.resetFRequest() = _ResetFRequest;
  const factory ExploreEvent.loadFRequest() = _LoadFRequest;
  const factory ExploreEvent.likeRequest(int index, bool F) = _LikeRequest;
  const factory ExploreEvent.unlikeRequest(int index, bool F) = _UnlikeRequest;
  const factory ExploreEvent.removeItem(int index, bool F) = _RemoveItem;
  const factory ExploreEvent.removeItemsByUserId(String id) = _RemoveItemsByUserId;
  const factory ExploreEvent.removeItemByPostId(String id) = _RemoveItemByPostId;
  const factory ExploreEvent.likeSyncRequest(String id) = _LikeSyncRequest;
  const factory ExploreEvent.unlikeSyncRequest(String id) = _UnlikeSyncRequest;
}