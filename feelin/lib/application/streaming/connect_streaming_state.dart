part of 'connect_streaming_bloc.dart';

@freezed
class ConnectStreamingState with _$ConnectStreamingState {
  const factory ConnectStreamingState({
    required Option<Either<ConnectFailure, RedirectUrl>> requestFailureOrSuccessOption,
    required bool isSubmitting,
  }) = _ConnectStreamingState;
  factory ConnectStreamingState.initial() => ConnectStreamingState(
    requestFailureOrSuccessOption: none(),
    isSubmitting: false,
  );
}