import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/profile/profile_failure.dart';
import 'package:rxdart/rxdart.dart';

import '../../../domain/profile/value_objects.dart';
import '../../../infrastructure/profile/profile_repository.dart';

part 'edit_profile_form_bloc.freezed.dart';
part 'edit_profile_form_event.dart';
part 'edit_profile_form_state.dart';

@injectable
class EditProfileFormBloc extends Bloc<EditProfileFormEvent, EditProfileFormState> {
  final ProfileRepository _profileRepository;

  EditProfileFormBloc(this._profileRepository) : super(EditProfileFormState.initial()) {
    // debounce 를 이용한 사용자 이름 중복 확인
    on<_UsernameChanged>((event, emit) async {
      emit(state.copyWith(
        username: Username(event.usernameStr),
      ));
      // 유저네임 중복 요청 api
      if(state.username.isValid()){
        final failureOrSuccess = await _profileRepository.checkUsername(username: state.username,);
        failureOrSuccess.fold(
              (f) {
            emit(state.copyWith(
              canUseName: false,
            ));
          },
              (existsUsername) {
            emit(state.copyWith(
              canUseName: !existsUsername,
            ));
          },
        );
      }
    },
      transformer: (events, mapper) => events.debounceTime(const Duration(milliseconds: 500)).switchMap(mapper),);
    on<_ResetCanUseName>((event, emit) {
      emit(state.copyWith(
        canUseName: false,
      ));
    },);
    on<_IntroductionChanged>((event, emit) {
      emit(state.copyWith(
        introduction: Introduction(event.introductionStr),
      ));
    });

    on<_NameChanged>((event, emit) {
      emit(state.copyWith(
        name: NotEmptyString(event.nameStr),
      ));
    });

    on<_Submitted>((event, emit) async {
      emit(state.copyWith(
        isSubmitting: true,
      ));
      if(state.introduction.isValid() && state.username.isValid() && state.name.isValid()){
        final failureOrSuccess = await _profileRepository.editMyProfile(
          name: state.name, username: state.username, introduction: state.introduction, image: null,
        );
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
              editFailureOrSuccessOption: some(right(unit)),
            ));
          },
        );
      }
    });
  }
}