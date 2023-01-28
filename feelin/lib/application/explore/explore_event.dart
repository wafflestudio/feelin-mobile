part of 'explore_bloc.dart';

@freezed
class ExploreEvent with _$ExploreEvent {
  const factory ExploreEvent.loadRequest() = _LoadRequest;
  const factory ExploreEvent.resetRequest() = _ResetRequest;
  const factory ExploreEvent.resetFRequest() = _ResetFRequest;
  const factory ExploreEvent.loadFRequest() = _LoadFRequest;
  const factory ExploreEvent.likeRequest(int index, bool F) = _LikeRequest;
  const factory ExploreEvent.unlikeRequest(int index, bool F) = _UnlikeRequest;
  const factory ExploreEvent.removeItem(int index) = _RemoveItem;
}