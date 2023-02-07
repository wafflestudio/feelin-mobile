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
      if(!state.isLoading){
        emit(state.copyWith(
          isLoading: true,
        ));
        if(!state.isLast){
          final failureOrSuccess = await _exploreRepository.getFeed(cursor: state.cursor);
          if(state.reset){
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
                  reset: false,
                  loadFailureOrSuccessOption: some(right(tuple.value1)),
                  feeds: tuple.value1.content,
                  isLast: tuple.value1.last,
                  cursor: tuple.value2,
                ));
              },
            );
          }else{
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
                  isLast: tuple.value1.last,
                  cursor: tuple.value2,
                ));
              },
            );
          }
        }else{
          emit(state.copyWith(
            isLoading: false,
          ));
        }
      }
    });
    on<_LoadFRequest>((event, emit) async {
      if(!state.isLoadingF){
        emit(state.copyWith(
          isLoadingF: true,
        ));
        if(!state.isLastF){
          final failureOrSuccess = await _exploreRepository.getFeedFollowing(cursor: state.cursorF);
          if(state.resetF){
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
                  resetF: false,
                  loadFFailureOrSuccessOption: some(right(tuple.value1)),
                  feedsF: tuple.value1.content,
                  isLastF: tuple.value1.last,
                  cursorF: tuple.value2,
                ));
              },
            );
          }else{
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
                  isLastF: tuple.value1.last,
                  cursorF: tuple.value2,
                ));
              },
            );
          }
        }else{
          emit(state.copyWith(
            isLoadingF: false,
          ));
        }
      }
    });
    on<_ResetRequest>((event, emit) async {
      emit(state.copyWith(
        reset: true,
        isLast: false,
        cursor: null,
        isLoading: false,
      ));
    });
    on<_ResetFRequest>((event, emit) async {
      emit(state.copyWith(
        resetF: true,
        isLastF: false,
        cursorF: null,
        isLoadingF: false,
      ));
    });

    on<_LikeRequest>((event, emit) async {
      final feeds = event.F ? state.feedsF : state.feeds;
      if(!feeds[event.index].isLiked!){
        final failureOrSuccess = await _exploreRepository.like(id: feeds[event.index].id);
        failureOrSuccess.fold(
              (f) {
            feeds[event.index].isLiked = true;
            //feeds[event.index].likeCount = feeds[event.index].likeCount! + 1;
          },
              (posts) {
                feeds[event.index].isLiked = true;
                //feeds[event.index].likeCount = feeds[event.index].likeCount! + 1;
          },
        );
      }
    });

    on<_UnlikeRequest>((event, emit) async {
      final feeds = event.F ? state.feedsF : state.feeds;
      if(feeds[event.index].isLiked!){
        final failureOrSuccess = await _exploreRepository.unlike(id: feeds[event.index].id);
        failureOrSuccess.fold(
              (f) {
            feeds[event.index].isLiked = false;
            //feeds[event.index].likeCount = feeds[event.index].likeCount! - 1;
          },
              (posts) {
            feeds[event.index].isLiked = false;
            //feeds[event.index].likeCount = feeds[event.index].likeCount! - 1;
          },
        );
      }
    });

    on<_RemoveItem>((event, emit) async {
      if(event.F){
        emit(state.copyWith(
          feedsF: List.from(state.feedsF)..removeAt(event.index),
        ));
      }else{
        emit(state.copyWith(
          feeds: List.from(state.feeds)..removeAt(event.index),
        ));
      }
    });

    on<_RemoveItemsByUserId>((event, emit) async {
      emit(state.copyWith(
        feeds: List.from(state.feeds)..removeWhere((post) => post.writer!.id == event.id),
        feedsF: List.from(state.feedsF)..removeWhere((post) => post.writer!.id == event.id),
      ));
    });

    on<_LikeSyncRequest>((event, emit) async {
      final Post? post = List.from(state.feeds).firstWhere((post) => post.id == event.id, orElse: ()=>null);
      if(post != null){
        post.isLiked = true;
        post.likeCount = post.likeCount! + 1;
      }
      final Post? postF = List.from(state.feedsF).firstWhere((post) => post.id == event.id, orElse: ()=>null);
      if(postF != null){
        postF.isLiked = true;
        postF.likeCount = postF.likeCount! + 1;
      }
    });

    on<_UnlikeSyncRequest>((event, emit) async {
      final Post? post = List.from(state.feeds).firstWhere((post) => post.id == event.id, orElse: ()=>null);
      if(post != null){
        post.isLiked = false;
        post.likeCount = post.likeCount! - 1;
      }
      final Post? postF = List.from(state.feedsF).firstWhere((post) => post.id == event.id, orElse: ()=>null);
      if(postF != null){
        postF.isLiked = false;
        postF.likeCount = postF.likeCount! - 1;
      }
    });
  }
}