import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/profile/pageable.dart';
import 'package:music_sns/domain/profile/post_thumbnail.dart';
import 'package:music_sns/domain/profile/profile_failure.dart';
import 'package:music_sns/infrastructure/post/post_repository.dart';
import 'package:music_sns/infrastructure/profile/profile_repository.dart';

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
        final failureOrSuccess = await _profileRepository.getPosts(id: 2);
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
  }
}