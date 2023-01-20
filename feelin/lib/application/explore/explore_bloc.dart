import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/explore/explore_failure.dart';
import '../../domain/play/post.dart';
import '../../domain/profile/page.dart';
import '../../infrastructure/explore/explore_repository.dart';

part 'explore_bloc.freezed.dart';
part 'explore_event.dart';
part 'explore_state.dart';

@injectable
class ExploreBloc extends Bloc<ExploreEvent, ExploreState>{
  final ExploreRepository _exploreRepository;
  ExploreBloc(this._exploreRepository) : super(ExploreState.initial()){
    on<_LoadRequest>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));

      if(!state.isLast){
        final failureOrSuccess = await _exploreRepository.getFeed(cursor: state.cursor);
        failureOrSuccess.fold(
              (f) {
            emit(state.copyWith(
              isLoading: false,
              loadFailureOrSuccessOption: some(left(f)),
            ));
          },
              (tuple) {
            emit(state.copyWith(
              isLoading: false,
              loadFailureOrSuccessOption: some(right(tuple.value1)),
              feeds: state.feeds + tuple.value1.content,
              // For the test
              isLast: tuple.value1.last,
              cursor: tuple.value2,
            ));
          },
        );
      }
    });
    on<_LoadFRequest>((event, emit) async {
      emit(state.copyWith(
        isLoadingF: true,
      ));

      if(!state.isLastF){
        final failureOrSuccess = await _exploreRepository.getFeedFollowing(cursor: state.cursorF);
        failureOrSuccess.fold(
              (f) {
            emit(state.copyWith(
              isLoadingF: false,
              loadFFailureOrSuccessOption: some(left(f)),
            ));
          },
              (tuple) {
            emit(state.copyWith(
              isLoadingF: false,
              loadFFailureOrSuccessOption: some(right(tuple.value1)),
              feedsF: state.feedsF + tuple.value1.content,
              // For the test
              isLastF: tuple.value1.last,
              cursorF: tuple.value2,
            ));
          },
        );
      }
    });
    on<_ResetRequest>((event, emit) async {
      emit(state.copyWith(
        feeds: [],
        isLast: false,
        cursor: null,
      ));
    });
    on<_ResetFRequest>((event, emit) async {
      emit(state.copyWith(
        feedsF: [],
        isLastF: false,
        cursorF: null,
      ));
    });
  }
}