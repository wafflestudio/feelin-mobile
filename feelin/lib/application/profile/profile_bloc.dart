import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/profile/page.dart';
import 'package:music_sns/domain/profile/profile.dart';
import 'package:music_sns/domain/profile/profile_failure.dart';
import 'package:music_sns/infrastructure/profile/profile_repository.dart';

import '../../domain/play/post.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState>{
  final ProfileRepository _profileRepository;
  ProfileBloc(this._profileRepository) : super(ProfileState.initial()){
    on<_MyPageRequest>((event, emit) async {
      if(!state.isLast){
        final failureOrSuccess = await _profileRepository.getMyPosts(cursor: state.cursor);
        failureOrSuccess.fold(
              (f) {
            emit(state.copyWith(
              loadFailureOrSuccessOption: some(left(f)),
            ));
          },
              (tuple) {
            emit(state.copyWith(
              loadFailureOrSuccessOption: some(right(tuple.value1)),
              posts: state.posts + tuple.value1.content,
              isLast: tuple.value1.last,
              cursor: tuple.value2,
            ));
          },
        );
      }
    });
    on<_PageRequest>((event, emit) async {
      if(!state.isLast){
        final failureOrSuccess = await _profileRepository.getPostsById(id: event.id, cursor: state.cursor);
        failureOrSuccess.fold(
              (f) {
            emit(state.copyWith(
              loadFailureOrSuccessOption: some(left(f)),
            ));
          },
              (tuple) {
                emit(state.copyWith(
                  loadFailureOrSuccessOption: some(right(tuple.value1)),
                  posts: state.posts + tuple.value1.content,
                  isLast: tuple.value1.last,
                  cursor: tuple.value2,
                ));
          },
        );
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
              isFollowed: false,
            ));
          },
              (posts) {
            emit(state.copyWith(
              isFollowed: true,
            ));
            state.profile.followerCount = state.profile.followerCount! + 1;
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
              isFollowed: true,
            ));
          },
              (posts) {
            emit(state.copyWith(
              isFollowed: false,
            ));
            state.profile.followerCount = state.profile.followerCount! - 1;
          },
        );
      }
    });

    on<_RemoveItem>((event, emit) async {
      emit(state.copyWith(
        posts: List.from(state.posts)..removeAt(event.index),
      ));
    });
  }
}