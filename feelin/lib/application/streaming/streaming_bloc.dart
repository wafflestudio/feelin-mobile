import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/streaming/vendor.dart';

import '../../domain/streaming/connect_failure.dart';
import '../../domain/streaming/vendor_accounts.dart';
import '../../infrastructure/streaming/streaming_repository.dart';

part 'streaming_bloc.freezed.dart';
part 'streaming_event.dart';
part 'streaming_state.dart';

@injectable
class StreamingBloc extends Bloc<StreamingEvent, StreamingState> {
  final StreamingRepository _streamingRepository;
  final storage = const FlutterSecureStorage();

  StreamingBloc(this._streamingRepository) : super(StreamingState.initial()) {

    on<_GetMyAccount>((event, emit) async {
      final failureOrSuccess = await _streamingRepository.getMyAccounts();
      failureOrSuccess.fold(
            (f) {
          emit(state.copyWith(
            fetchAccountFailureOrSuccessOption: some(left(f)),
          ));
        },
            (vendorAccounts) {
          emit(state.copyWith(
            fetchAccountFailureOrSuccessOption: some(right(vendorAccounts)),
            isConnected: vendorAccounts.accounts.isNotEmpty,
          ));
          if(vendorAccounts.accounts.isNotEmpty){
            final String vendor = vendorAccounts.accounts.first.vendor;
            final String vendorId = vendorAccounts.accounts.first.id;
            emit(state.copyWith(
              vendorId: vendorId,
            ));
            switch(vendor){
              case 'spotify': {
                emit(state.copyWith(
                  vendor: Vendor.spotify,
                ));
                break;
              }
              case 'applemusic': {
                emit(state.copyWith(
                  vendor: Vendor.appleMusic,
                ));
                break;
              }
            }
          }
        },
      );
    });
    on<_DisconnectMyAccount>((event, emit) async {
      if(state.isConnected){
        final failureOrSuccess = await _streamingRepository.disconnectMyAccount(vendorId: state.vendorId);
        failureOrSuccess.fold(
              (f) {
            emit(state.copyWith(
              disconnectFailureOrSuccessOption: some(left(f)),
            ));
          },
              (_) {
            emit(state.copyWith(
              disconnectFailureOrSuccessOption: some(right(_)),
              isConnected: false,
              vendor: Vendor.none,
              vendorId: '',
            ));
          },
        );
      }
    });

    on<_SaveRequest>((event, emit) async {
      if(true){
        emit(state.copyWith(
          isSaving: true,
        ));
        final failureOrSuccess = await _streamingRepository.save(playlistId: event.playlistId, vendorId: state.vendorId, title: event.title, content: event.content);
        failureOrSuccess.fold(
              (f) {
            emit(state.copyWith(
              isSaving: false,
              saveFailureOrSuccessOption: some(left(event.title)),
            ));
          },
              (url) {
            emit(state.copyWith(
              isSaving: false,
              saveFailureOrSuccessOption: some(right(event.title)),
            ));
          },
        );
      }
    });

    on<_ResetState>((event, emit) async {
      emit(state.copyWith(
        saveFailureOrSuccessOption: none(),
      ));
    });
  }
}