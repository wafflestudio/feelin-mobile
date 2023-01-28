part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required bool initialLoading,
    required bool authenticated,
    required String id,
  }) = _AuthState;
  factory AuthState.initial() => const AuthState(
    initialLoading: true,
    authenticated: false,
    id: '',
  );
}