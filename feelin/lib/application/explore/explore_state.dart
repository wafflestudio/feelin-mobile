part of 'explore_bloc.dart';

@freezed
class ExploreState with _$ExploreState {
  const factory ExploreState({
    required bool isLoading,
    required bool isLoadingF,
    required Option<Either<ExploreFailure, Page>> loadFailureOrSuccessOption,
    required Option<Either<ExploreFailure, Page>> loadFFailureOrSuccessOption,
    required List<Post> feeds,
    required List<Post> feedsF,
    required bool isLast,
    required bool isLastF,
    required bool reset,
    required bool resetF,
    required String? cursor,
    required String? cursorF,
  }) = _ExploreState;
  factory ExploreState.initial() => ExploreState(
    isLoading: false,
    isLoadingF: false,
    loadFailureOrSuccessOption: none(),
    loadFFailureOrSuccessOption: none(),
    feeds: [],
    feedsF: [],
    isLast: false,
    isLastF: false,
    reset: false,
    resetF: false,
    cursor: null,
    cursorF: null,
  );
}