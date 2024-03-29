import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/block/block_failure.dart';
import 'package:music_sns/domain/explore/explore_post_failure.dart';
import 'package:music_sns/domain/play/playlist.dart';
import 'package:music_sns/domain/play/post.dart';
import 'package:music_sns/domain/profile/profile.dart';
import 'package:music_sns/infrastructure/block/block_repository.dart';
import 'package:music_sns/infrastructure/explore/explore_post_repository.dart';

import '../../domain/streaming/redirect_url.dart';
import '../../presentation/app/my_key_store.dart';

part 'playlist_info_bloc.freezed.dart';
part 'playlist_info_event.dart';
part 'playlist_info_state.dart';

@injectable
class PlaylistInfoBloc extends Bloc<PlaylistInfoEvent, PlaylistInfoState>{
  final ExplorePostRepository _explorePostRepository;
  final BlockRepository _blockRepository;
  PlaylistInfoBloc(this._explorePostRepository, this._blockRepository) : super(PlaylistInfoState.initial()){
    on<_LoadRequest>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));
      final failureOrSuccess = await _explorePostRepository.getPost(id: event.postId);
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
            (post) {
          emit(state.copyWith(
            isLoading: false,
            loadFailureOrSuccessOption: some(right(post)),
            post: post,
            isLiked: post.isLiked!
          ));
        },
      );
    });
    on<_ReloadRequest>((event, emit) async {
      final failureOrSuccess = await _explorePostRepository.getPost(id: event.postId);
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
            (post) {
          emit(state.copyWith(
              loadFailureOrSuccessOption: some(right(post)),
              post: post,
              isLiked: post.isLiked!
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
          MyKeyStore.exploreKey.currentState?.removeItemByPostId(event.postId);
          MyKeyStore.profileKey.currentState?.removeItemByPostId(event.postId);
        },
      );
    });

    on<_LikeRequest>((event, emit) async {
      if(!state.isLiked){
        final failureOrSuccess = await _explorePostRepository.like(id: state.post.id);
        failureOrSuccess.fold(
              (f) {
            emit(state.copyWith(
              isLiked: true,
            ));
            state.post.likeCount = state.post.likeCount! + 1;
            MyKeyStore.exploreKey.currentState?.syncLike(state.post.id);
          },
              (posts) {
            emit(state.copyWith(
              isLiked: true,
            ));
            state.post.likeCount = state.post.likeCount! + 1;
            MyKeyStore.exploreKey.currentState?.syncLike(state.post.id);
          },
        );
      }
    });

    on<_UnlikeRequest>((event, emit) async {
      if(state.isLiked){
        final failureOrSuccess = await _explorePostRepository.unlike(id: state.post.id);
        failureOrSuccess.fold(
              (f) {
            emit(state.copyWith(
              isLiked: false,
            ));
            state.post.likeCount = state.post.likeCount! - 1;
            MyKeyStore.exploreKey.currentState?.syncUnlike(state.post.id);
          },
              (posts) {
            emit(state.copyWith(
              isLiked: false,
            ));
            state.post.likeCount = state.post.likeCount! - 1;
            MyKeyStore.exploreKey.currentState?.syncUnlike(state.post.id);
          },
        );
      }else{
        emit(state.copyWith(
          isLiked: false,
        ));
      }
    });

    on<_ReportRequest>((event, emit) async {
      emit(state.copyWith(
        reportFailureOrSuccessOption: none(),
      ));
      final failureOrSuccess = await _explorePostRepository.report(reportType: event.reportType, username: state.post.writer!.username, description: event.description, post: state.post);
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
      final failureOrSuccess = await _blockRepository.blockUser(id: state.post.writer!.id,);
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
          MyKeyStore.explorePageKey.currentState?.removeItemsByUserId(state.post.writer!.id);
        },
      );
    });

    on<_SaveRequest>((event, emit) async {
      if(!state.isSaving){
        emit(state.copyWith(
          isSaving: true,
        ));
        final failureOrSuccess = await _explorePostRepository.save(playlistId: state.post.playlist.id, vendorId: event.vendorId, title: state.post.title, content: state.post.content);
        failureOrSuccess.fold(
              (f) {
            emit(state.copyWith(
              isSaving: false,
              saveFailureOrSuccessOption: some(left(f)),
            ));
          },
              (url) {
            emit(state.copyWith(
              isSaving: false,
              saveFailureOrSuccessOption: some(right(RedirectUrl(url: url))),
            ));
          },
        );
      }
    });

    on<_ResetStateRequest>((event, emit) async {
      emit(state.copyWith(
        reportFailureOrSuccessOption: none(),
        blockFailureOrSuccessOption: none(),
        saveFailureOrSuccessOption: none(),
      ));
    });
  }
}