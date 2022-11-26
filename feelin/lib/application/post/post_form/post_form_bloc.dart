import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_sns/domain/play/album.dart';
import 'package:music_sns/domain/play/artist.dart';
import 'package:music_sns/domain/play/playlist.dart';
import 'package:music_sns/domain/play/playlist_preview.dart';
import 'package:music_sns/domain/play/track.dart';
import 'package:music_sns/infrastructure/post/playlist_repository.dart';

import '../../../domain/post/post_failure.dart';
import '../../../domain/post/value_objects.dart';

part 'post_form_event.dart';
part 'post_form_state.dart';
part 'post_form_bloc.freezed.dart';

@injectable
class PostFormBloc extends Bloc<PostFormEvent, PostFormState>{
  final PlaylistRepository _playlistRepository;
  PostFormBloc(this._playlistRepository) : super(PostFormState.initial()){
    on<_UrlChanged>((event, emit){
      emit(state.copyWith(
        playlistUrl : PlaylistUrl(event.urlStr),
      ));
    });
    on<_Submitted>((event, emit) async {
      emit(state.copyWith(
        isSubmitting: true,
        isNavigated: false,
      ));

      if(state.playlistUrl.isValid()){
        final failureOrSuccess = await _playlistRepository.postPlaylist(
            playlistUrl: state.playlistUrl);
        failureOrSuccess.fold(
              (f) {
            emit(state.copyWith(
              isSubmitting: false,
              postFailureOrSuccessOption: some(left(f)),
            ));
          },
              (playlist) {
            emit(state.copyWith(
              isSubmitting: false,
              postFailureOrSuccessOption: some(right(playlist)),
            ));
          },
        );
      }else{
        emit(state.copyWith(
          isSubmitting : false,
          postFailureOrSuccessOption: some(left(const PostFailure.invalidUrl())),
        ));
      }
    });
    on<_Navigated>((event, emit){
      emit(state.copyWith(
        isNavigated: true,
        postFailureOrSuccessOption: none(),
      ));
    });
  }
}