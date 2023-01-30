import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/block/block_failure.dart';

import '../../domain/follow/page_user.dart';
import '../../domain/profile/profile.dart';
import '../../infrastructure/block/block_repository.dart';

part 'blocked_user_bloc.freezed.dart';
part 'blocked_user_event.dart';
part 'blocked_user_state.dart';

@injectable
class BlockedUserBloc extends Bloc<BlockedUserEvent, BlockedUserState>{
  final BlockRepository _blockRepository;
  BlockedUserBloc(this._blockRepository) : super(BlockedUserState.initial()){
    on<_LoadRequest>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));

      if(!state.isLast){
        final failureOrSuccess = await _blockRepository.getBlockedUsers(cursor: state.cursor);
        failureOrSuccess.fold(
              (f) {
            emit(state.copyWith(
              isLoading: false,
              loadFailureOrSuccessOption: some(left(f)),
            ));
          },
              (tuple) {
            emit(state.copyWith(
              isLoading: false,
              loadFailureOrSuccessOption: some(right(tuple.value1)),
              users: state.users + tuple.value1.content,
              // For the test
              isLast: tuple.value1.last,
              cursor: tuple.value2,
            ));
          },
        );
      }
    });

    on<_ResetRequest>((event, emit) async {
      emit(state.copyWith(
        users: [],
        isLast: false,
        cursor: null,
      ));
    });


    on<_UnBlockRequest>((event, emit) async {
      final failureOrSuccess = await _blockRepository.unblockUser(id: state.users[event.index].id);
      failureOrSuccess.fold(
            (f) {
          emit(state.copyWith(
            unblockFailureOrSuccessOption : some(left(f)),
          ));

        },
            (_) {
          emit(state.copyWith(
            unblockFailureOrSuccessOption : some(right(_)),
            users: List.from(state.users)..removeAt(event.index),
          ));
        },
      );
    });
  }
}