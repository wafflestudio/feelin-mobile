part of 'connect_streaming_bloc.dart';

@freezed
class ConnectStreamingState with _$ConnectStreamingState {
  const factory ConnectStreamingState({
    required Option<Either<ConnectFailure, RedirectUrl>> urlRequestFailureOrSuccessOption,
    required Option<Either<ConnectFailure, Unit>> requestFailureOrSuccessOption,
    required bool isSubmitting,
  }) = _ConnectStreamingState;
  factory ConnectStreamingState.initial() => ConnectStreamingState(
    urlRequestFailureOrSuccessOption: none(),
    requestFailureOrSuccessOption: none(),
    isSubmitting: false,
  );
}