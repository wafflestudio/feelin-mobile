import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/play/playlist_preview.dart';
import 'package:music_sns/domain/post/value_objects.dart';

import '../../../domain/play/playlist.dart';
import '../../../domain/post/post_failure.dart';
import '../../../infrastructure/post/post_repository.dart';

part 'post_detail_form_event.dart';
part 'post_detail_form_state.dart';
part 'post_detail_form_bloc.freezed.dart';

@injectable
class PostDetailFormBloc extends Bloc<PostDetailFormEvent, PostDetailFormState>{
  final PostRepository _postRepository;
  PostDetailFormBloc(this._postRepository) : super(PostDetailFormState.initial()){
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
              (_) {
            emit(state.copyWith(
              isSubmitting: false,
              postFailureOrSuccessOption: some(right(_)),
            ));
          },
        );
      }
    });
  }
}