part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required bool initialLoading,
    required bool authenticated,
  }) = _AuthState;
  factory AuthState.initial() => AuthState(
    initialLoading: true,
    authenticated: false,
  );
}