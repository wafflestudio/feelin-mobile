import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/play/playlist.dart';
import 'package:music_sns/domain/play/playlist_preview.dart';
import 'package:music_sns/domain/play/post.dart';
import 'package:music_sns/infrastructure/post/playlist_repository.dart';

import '../../../domain/post/post_failure.dart';
import '../../../domain/post/value_objects.dart';
import '../../../infrastructure/post/post_repository.dart';

part 'post_form_bloc.freezed.dart';
part 'post_form_event.dart';
part 'post_form_state.dart';

@injectable
class PostFormBloc extends Bloc<PostFormEvent, PostFormState>{
  final PlaylistRepository _playlistRepository;
  final PostRepository _postRepository;

  PostFormBloc(this._playlistRepository, this._postRepository) : super(PostFormState.initial()){
    on<_UrlChanged>((event, emit) async{
      emit(state.copyWith(
        playlistUrl : PlaylistUrl(event.urlStr),
        fetchFailureOrSuccessOption: none(),
      ));
    });

    on<_FetchRequested>((event, emit) async {
      emit(state.copyWith(
        isFetching : true,
      ));
      if(state.playlistUrl.isValid()){
        final failureOrSuccess = await _playlistRepository.postPlaylist(
            playlistUrl: state.playlistUrl);
        failureOrSuccess.fold(
              (f) {
            emit(state.copyWith(
              isFetching: false,
              isSuccessfulFetch : false,
              fetchFailureOrSuccessOption: some(left(f)),
            ));
          },
              (playlist) {
            emit(state.copyWith(
              isFetching: false,
              isSuccessfulFetch : true,
              playlist : playlist,
              playlistPreview: playlist.playlistPreview!,
              fetchFailureOrSuccessOption: some(right(playlist)),
            ));
          },
        );
      }else{
        emit(state.copyWith(
          isFetching : false,
          fetchFailureOrSuccessOption: some(left(const PostFailure.invalidUrl())),
        ));
      }
    });

    on<_TitleChanged>((event, emit){
      emit(state.copyWith(
        title : NotEmptyString(event.titleStr),
      ));
    });
    on<_ContentChanged>((event, emit){
      emit(state.copyWith(
        content : ContentString(event.contentStr),
      ));
    });
    on<_PlaylistPreviewChanged>((event, emit){
      emit(state.copyWith(
        playlistPreview : event.playlistPreview,
      ));
    });
    on<_Submitted>((event, emit) async {
      emit(state.copyWith(
        isSubmitting: true,
      ));
      if(!state.title.isValid()){
        emit(state.copyWith(
          postFailureOrSuccessOption: some(left(const PostFailure.blankedTitle())),
        ));
      }else if(!state.content.isValid()){
        emit(state.copyWith(
          postFailureOrSuccessOption: some(left(const PostFailure.exceedingMaxContentLength())),
        ));
      }else {
        final failureOrSuccess = await _postRepository.createPost(playlistPreview: state.playlistPreview, title: state.title, content: state.content);
        failureOrSuccess.fold(
              (f) {
            emit(state.copyWith(
              isSubmitting: false,
              postFailureOrSuccessOption: some(left(f)),
            ));
          },
              (post) {
            emit(state.copyWith(
              isSubmitting: false,
              postFailureOrSuccessOption: some(right(post)),
            ));
          },
        );
      }
    });
  }
}