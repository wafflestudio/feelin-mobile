import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/explore/explore_post_failure.dart';
import 'package:music_sns/domain/play/playlist.dart';
import 'package:music_sns/domain/play/post.dart';
import 'package:music_sns/domain/profile/profile.dart';
import 'package:music_sns/infrastructure/explore/explore_post_repository.dart';

part 'playlist_info_event.dart';
part 'playlist_info_state.dart';
part 'playlist_info_bloc.freezed.dart';

@injectable
class PlaylistInfoBloc extends Bloc<PlaylistInfoEvent, PlaylistInfoState>{
  final ExplorePostRepository _explorePostRepository;
  PlaylistInfoBloc(this._explorePostRepository) : super(PlaylistInfoState.initial()){
    on<_LoadRequest>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));

      final failureOrSuccess = await _explorePostRepository.getPost(id: event.postId);
      failureOrSuccess.fold(
            (f) {
          emit(state.copyWith(
            isLoading: false,
            loadFailureOrSuccessOption: some(left(f)),
          ));
        },
            (post) {
          emit(state.copyWith(
            isLoading: false,
            loadFailureOrSuccessOption: some(right(post)),
            post: post,
          ));
        },
      );
    });
    on<_DeleteRequest>((event, emit) async {
      final failureOrSuccess = await _explorePostRepository.deletePost(id: event.postId);
      failureOrSuccess.fold(
            (f) {
          emit(state.copyWith(
            deleteFailureOrSuccessOption: some(left(f)),
          ));
        },
            (post) {
          emit(state.copyWith(
            deleteFailureOrSuccessOption: some(right(unit)),
          ));
        },
      );
    });
  }
}