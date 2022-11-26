import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/profile/pageable.dart';
import 'package:music_sns/domain/profile/post_thumbnail.dart';
import 'package:music_sns/domain/profile/profile.dart';
import 'package:music_sns/domain/profile/profile_failure.dart';
import 'package:music_sns/infrastructure/post/post_repository.dart';
import 'package:music_sns/infrastructure/profile/profile_repository.dart';

import '../../domain/play/post.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState>{
  final ProfileRepository _profileRepository;
  ProfileBloc(this._profileRepository) : super(ProfileState.initial()){
    on<_PageRequest>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));

      if(!state.isLast){
        final failureOrSuccess = await _profileRepository.getMyPosts();
        failureOrSuccess.fold(
              (f) {
            emit(state.copyWith(
              isLoading: false,
              loadFailureOrSuccessOption: some(left(f)),
            ));
          },
              (posts) {
            emit(state.copyWith(
              isLoading: false,
              loadFailureOrSuccessOption: some(right(posts)),
              posts: posts.content,
              // For the test
              isLast: true,
            ));
          },
        );
      }
    });
    on<_ProfileRequest>((event, emit) async {
      final failureOrSuccess = await _profileRepository.getMyProfile();
      failureOrSuccess.fold(
            (f) {
          emit(state.copyWith(
            loadFailureOrSuccessOption: some(left(f)),
          ));
        },
            (profile) {
          emit(state.copyWith(
            isLoaded: true,
            profile: profile,
          ));
        },
      );
    });
    on<_ProfileChanged>((event, emit) async {
      emit(state.copyWith(
        profile: event.profile
      ));
    });
  }
}