import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/play/playlist_preview.dart';

import '../../../domain/post/post_failure.dart';
import '../../../domain/post/value_objects.dart';
import '../../../infrastructure/post/post_repository.dart';

part 'edit_post_form_bloc.freezed.dart';
part 'edit_post_form_event.dart';
part 'edit_post_form_state.dart';

@injectable
class EditPostFormBloc extends Bloc<EditPostFormEvent, EditPostFormState>{
  final PostRepository _postRepository;
  EditPostFormBloc(this._postRepository) : super(EditPostFormState.initial()){
    on<_IdChanged>((event, emit){
      emit(state.copyWith(
        postId : event.id,
      ));
    });

    on<_TitleChanged>((event, emit){
      emit(state.copyWith(
        title : NotEmptyString(event.titleStr),
        editFailureOrSuccessOption: none(),
      ));
    });
    on<_ContentChanged>((event, emit){
      emit(state.copyWith(
        content : ContentString(event.contentStr),
        editFailureOrSuccessOption: none(),
      ));
    });
    on<_PreviewChanged>((event, emit){
      emit(state.copyWith(
        playlistPreview : event.preview,
      ));
    });
    on<_Submitted>((event, emit) async {
      emit(state.copyWith(
        isSubmitting: true,
      ));
      if(!state.title.isValid()){
        emit(state.copyWith(
          editFailureOrSuccessOption: some(left(const PostFailure.blankedTitle())),
        ));
      }else if(!state.content.isValid()){
        emit(state.copyWith(
          editFailureOrSuccessOption: some(left(const PostFailure.exceedingMaxContentLength())),
        ));
      }else {
        final failureOrSuccess = await _postRepository.editPost(playlistPreview: state.playlistPreview, title: state.title, content: state.content, id: state.postId);
        failureOrSuccess.fold(
              (f) {
            emit(state.copyWith(
              isSubmitting: false,
              editFailureOrSuccessOption: some(left(f)),
            ));
          },
              (_) {
            emit(state.copyWith(
              isSubmitting: false,
              editFailureOrSuccessOption: some(right(_)),
            ));
          },
        );
      }
    });
  }
}