import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/profile/page.dart';
import 'package:music_sns/domain/profile/profile.dart';
import 'package:music_sns/domain/profile/profile_failure.dart';
import 'package:music_sns/infrastructure/profile/profile_repository.dart';

import '../../domain/block/block_failure.dart';
import '../../domain/play/post.dart';
import '../../infrastructure/block/block_repository.dart';
import '../../presentation/app/my_key_store.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState>{
  final ProfileRepository _profileRepository;
  final BlockRepository _blockRepository;
  ProfileBloc(this._profileRepository, this._blockRepository) : super(ProfileState.initial()){
    on<_MyPageRequest>((event, emit) async {
      if(!state.isLoadingPage){
        emit(state.copyWith(
          isLoadingPage: true,
        ));
        if(!state.isLast){
          final failureOrSuccess = await _profileRepository.getMyPosts(cursor: state.cursor);
          failureOrSuccess.fold(
                (f) {
              emit(state.copyWith(
                loadFailureOrSuccessOption: some(left(f)),
                isLoadingPage: false,
              ));
            },
                (tuple) {
              emit(state.copyWith(
                loadFailureOrSuccessOption: some(right(tuple.value1)),
                isLoadingPage: false,
                posts: state.posts + tuple.value1.content,
                isLast: tuple.value1.last,
                cursor: tuple.value2,
              ));
            },
          );
        }else{
          emit(state.copyWith(
            isLoadingPage: false,
          ));
        }
      }

    });
    on<_PageRequest>((event, emit) async {
      if(!state.isLoadingPage){
        emit(state.copyWith(
          isLoadingPage: true,
        ));
        if(!state.isLast){
          final failureOrSuccess = await _profileRepository.getPostsById(id: event.id, cursor: state.cursor);
          failureOrSuccess.fold(
                (f) {
              emit(state.copyWith(
                loadFailureOrSuccessOption: some(left(f)),
                isLoadingPage: false,
              ));
            },
                (tuple) {
              emit(state.copyWith(
                loadFailureOrSuccessOption: some(right(tuple.value1)),
                isLoadingPage: false,
                posts: state.posts + tuple.value1.content,
                isLast: tuple.value1.last,
                cursor: tuple.value2,
              ));
            },
          );
        }else{
          emit(state.copyWith(
            isLoadingPage: false,
          ));
        }
      }

    });
    on<_ResetRequest>((event, emit) async {
      emit(state.copyWith(
        posts: [],
        isLast: false,
        cursor: null,
      ));
    });
    on<_MyProfileRequest>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));
      final failureOrSuccess = await _profileRepository.getMyProfile();
      failureOrSuccess.fold(
            (f) {
          emit(state.copyWith(
            isLoading: false,
            loadFailureOrSuccessOption: some(left(f)),
          ));
        },
            (profile) {
          emit(state.copyWith(
            isLoading: false,
            isLoaded: true,
            profile: profile,
          ));
        },
      );
    });
    on<_ProfileRequest>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));
      final failureOrSuccess = await _profileRepository.getProfileById(id: event.id);
      failureOrSuccess.fold(
            (f) {
              f.maybeMap(
                restricted: (_){
                  emit(state.copyWith(
                    isRestricted: true,
                  ));
                },
                orElse: (){},
              );
          emit(state.copyWith(
            isLoading: false,
            loadFailureOrSuccessOption: some(left(f)),
          ));
        },
            (profile) {
          emit(state.copyWith(
            isLoading: false,
            isLoaded: true,
            profile: profile,
            isFollowed: profile.isFollowed ?? false,
          ));
        },
      );
    });

    on<_ReMyProfileRequest>((event, emit) async {
      final failureOrSuccess = await _profileRepository.getMyProfile();
      failureOrSuccess.fold(
            (f) {
          emit(state.copyWith(
            loadFailureOrSuccessOption: some(left(f)),
          ));
        },
            (profile) {
          emit(state.copyWith(
            profile: profile,
          ));
        },
      );
    });
    on<_ReProfileRequest>((event, emit) async {
      final failureOrSuccess = await _profileRepository.getProfileById(id: event.id);
      failureOrSuccess.fold(
            (f) {
          f.maybeMap(
            restricted: (_){
              emit(state.copyWith(
                isRestricted: true,
              ));
            },
            orElse: (){},
          );
          emit(state.copyWith(
            loadFailureOrSuccessOption: some(left(f)),
          ));
        },
            (profile) {
          emit(state.copyWith(
            profile: profile,
            isFollowed: profile.isFollowed ?? false,
          ));
        },
      );
    });

    on<_ProfileChanged>((event, emit) async {
      emit(state.copyWith(
        profile: event.profile
      ));
    });

    on<_FollowRequest>((event, emit) async {

      if(!state.isFollowed){
        final failureOrSuccess = await _profileRepository.follow(id: state.profile.id);
        failureOrSuccess.fold(
              (f) {
            emit(state.copyWith(
              isFollowed: true,
            ));
          },
              (posts) {
            emit(state.copyWith(
              isFollowed: true,
            ));
            state.profile.followerCount = state.profile.followerCount! + 1;
            MyKeyStore.profileKey.currentState?.onRefresh();
            MyKeyStore.explorePageKey.currentState?.firstLoad();
          },
        );
      }
    });

    on<_UnFollowRequest>((event, emit) async {

      if(state.isFollowed){
        final failureOrSuccess = await _profileRepository.unFollow(id: state.profile.id);
        failureOrSuccess.fold(
              (f) {
            emit(state.copyWith(
              isFollowed: false,
            ));
          },
              (posts) {
            emit(state.copyWith(
              isFollowed: false,
            ));
            state.profile.followerCount = state.profile.followerCount! - 1;
            MyKeyStore.profileKey.currentState?.onRefresh();
            MyKeyStore.explorePageKey.currentState?.firstLoad();
          },
        );
      }
    });

    on<_ReportRequest>((event, emit) async {
      emit(state.copyWith(
        reportFailureOrSuccessOption: none(),
      ));
      final failureOrSuccess = await _profileRepository.report(reportType: event.reportType, username: state.profile.username, description: event.description,);
      failureOrSuccess.fold(
            (f) {
          emit(state.copyWith(
            reportFailureOrSuccessOption: some(left(f)),
          ));
        },
            (post) {
          emit(state.copyWith(
            reportFailureOrSuccessOption: some(right(unit)),
          ));
        },
      );
    });

    on<_BlockRequest>((event, emit) async {
      final failureOrSuccess = await _blockRepository.blockUser(id: state.profile.id,);
      failureOrSuccess.fold(
            (f) {
          emit(state.copyWith(
            blockFailureOrSuccessOption: some(left(f)),
          ));
        },
            (unit) {
          emit(state.copyWith(
            blockFailureOrSuccessOption: some(right(unit)),
            isRestricted: true,
          ));
          MyKeyStore.explorePageKey.currentState?.removeItemsByUserId(state.profile.id);
        },
      );
    });

    on<_RemoveItem>((event, emit) async {
      emit(state.copyWith(
        posts: List.from(state.posts)..removeAt(event.index),
      ));
    });

    on<_RemoveItemByPostId>((event, emit) async {
      emit(state.copyWith(
        posts: List.from(state.posts)..removeWhere((post) => post.id == event.id),
      ));
    });

    on<_ResetStateRequest>((event, emit) async {
      emit(state.copyWith(
        reportFailureOrSuccessOption: none(),
        blockFailureOrSuccessOption: none(),
      ));
    });
  }
}