part of 'explore_bloc.dart';

@freezed
class ExploreEvent with _$ExploreEvent {
  const factory ExploreEvent.loadRequest() = _LoadRequest;
  const factory ExploreEvent.resetRequest() = _ResetRequest;
  const factory ExploreEvent.resetFRequest() = _ResetFRequest;
  const factory ExploreEvent.loadFRequest() = _LoadFRequest;
}