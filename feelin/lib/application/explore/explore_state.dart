part of 'explore_bloc.dart';

@freezed
class ExploreState with _$ExploreState {
  const factory ExploreState({
    required bool isLoading,
  }) = _ExploreState;
  factory ExploreState.initial() => ExploreState(
    isLoading: false,
  );
  const factory ExploreState.loading() = Loading;
  const factory ExploreState.loaded() = Loaded;
}