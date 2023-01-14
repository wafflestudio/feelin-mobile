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
    cursor: null,
    cursorF: null,
  );
  // const factory ExploreState.loading() = Loading;
  // const factory ExploreState.loaded() = Loaded;
}