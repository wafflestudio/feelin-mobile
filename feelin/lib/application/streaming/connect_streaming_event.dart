part of 'connect_streaming_bloc.dart';

@freezed
class ConnectStreamingEvent with _$ConnectStreamingEvent {
  const factory ConnectStreamingEvent.requestLogin(String vendorStr) =
  _RequestLogin;
  const factory ConnectStreamingEvent.spotifyLogin() =
  _SpotifyLogin;
  const factory ConnectStreamingEvent.submitted() = _Submitted;
}