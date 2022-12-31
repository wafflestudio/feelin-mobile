import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/auth/token.dart';

import '../../../domain/auth/i_auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _authRepository;
  final storage = const FlutterSecureStorage();

  AuthBloc(this._authRepository) : super(AuthState.initial()) {
    on<_Submitted>((event, emit) async {
      emit(state.copyWith(
        initialLoading: true,
      ));
      if(await storage.containsKey(key: 'token')){
        final token = await storage.read(key: "token");
        if(token != null && token != ''){
          final failureOrSuccess = await _authRepository.getSignedInUser(token: Token(token: token));
          failureOrSuccess.fold(
                (f) {
              emit(state.copyWith(
                initialLoading: false,
                authenticated: false,
              ));
            },
                (_) {
              emit(state.copyWith(
                initialLoading: false,
                authenticated: true,
              ));
            },
          );
        }else{
          emit(state.copyWith(
            initialLoading: false,
            authenticated: false,
          ));
        }
      }else{
        emit(state.copyWith(
          initialLoading: false,
          authenticated: false,
        ));
      }

    });
  }
}