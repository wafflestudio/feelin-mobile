part of 'streaming_bloc.dart';

@freezed
class StreamingEvent with _$StreamingEvent {
  const factory StreamingEvent.disconnectMyAccount() = _DisconnectMyAccount;
  const factory StreamingEvent.getMyAccount() = _GetMyAccount;
  const factory StreamingEvent.saveRequest(String playlistId, String title, String content) = _SaveRequest;
  const factory StreamingEvent.resetState() = _ResetState;
}