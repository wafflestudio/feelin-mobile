import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/infrastructure/follow/follow_repository.dart';

import '../../domain/follow/page_user.dart';
import '../../domain/profile/profile.dart';
import '../../domain/profile/profile_failure.dart';
import '../../presentation/app/my_key_store.dart';

part 'follow_bloc.freezed.dart';
part 'follow_event.dart';
part 'follow_state.dart';

@injectable
class FollowBloc extends Bloc<FollowEvent, FollowState>{
  final FollowRepository _followRepository;
  FollowBloc(this._followRepository) : super(FollowState.initial()){
    on<_LoadFollowingsRequest>((event, emit) async {
      if(!state.isLoading){
        emit(state.copyWith(
          isLoading: true,
        ));
        if(!state.isLast){
          final failureOrSuccess = await _followRepository.getFollowingsById(id: event.id, cursor: state.cursor);
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
                users: state.users + tuple.value1.content,
                // For the test
                isLast: tuple.value1.last,
                cursor: tuple.value2,
              ));
            },
          );
        }else{
          emit(state.copyWith(
            isLoading: false,
          ));
        }
      }
    });
    on<_LoadFollowersRequest>((event, emit) async {
      if(!state.isLoading){
        emit(state.copyWith(
          isLoading: true,
        ));
        if(!state.isLast){
          final failureOrSuccess = await _followRepository.getFollowersById(id: event.id, cursor: state.cursor);
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
                users: state.users + tuple.value1.content,
                // For the test
                isLast: tuple.value1.last,
                cursor: tuple.value2,
              ));
            },
          );
        }else{
          emit(state.copyWith(
            isLoading: false,
          ));
        }
      }
    });

    on<_LoadLikesRequest>((event, emit) async {
      if(!state.isLoading){
        emit(state.copyWith(
          isLoading: true,
        ));
        if(!state.isLast){
          final failureOrSuccess = await _followRepository.getLikesById(id: event.id, cursor: state.cursor);
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
                users: state.users + tuple.value1.content,
                // For the test
                isLast: tuple.value1.last,
                cursor: tuple.value2,
              ));
            },
          );
        }else{
          emit(state.copyWith(
            isLoading: false,
          ));
        }
      }
    });

    on<_ResetRequest>((event, emit) async {
      emit(state.copyWith(
        users: [],
        isLast: false,
        cursor: null,
      ));
    });

    on<_FollowRequest>((event, emit) async {
      if(!state.users[event.index].isFollowed!){
        final failureOrSuccess = await _followRepository.follow(id: state.users[event.index].id);
        failureOrSuccess.fold(
              (f) {
            state.users[event.index].isFollowed = false;
          },
              (posts) {
            state.users[event.index].isFollowed = true;
            MyKeyStore.profileKey.currentState?.onRefresh();
            MyKeyStore.explorePageKey.currentState?.firstLoad();
          },
        );
      }
    });

    on<_UnFollowRequest>((event, emit) async {
      if(state.users[event.index].isFollowed!){
        final failureOrSuccess = await _followRepository.unFollow(id: state.users[event.index].id);
        failureOrSuccess.fold(
              (f) {
                state.users[event.index].isFollowed = true;
          },
              (posts) {
                state.users[event.index].isFollowed = false;
                MyKeyStore.profileKey.currentState?.onRefresh();
                MyKeyStore.explorePageKey.currentState?.firstLoad();
          },
        );
      }
    });
  }
}