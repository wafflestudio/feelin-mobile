part of 'streaming_bloc.dart';

@freezed
class StreamingEvent with _$StreamingEvent {
  const factory StreamingEvent.disconnectMyAccount() = _DisconnectMyAccount;
  const factory StreamingEvent.getMyAccount() = _GetMyAccount;
}