import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/auth/login/auth_repository.dart';
import 'package:music_sns/auth/login/form_submission_status.dart';
import 'package:music_sns/auth/login/login_event.dart';
import 'package:music_sns/auth/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{

  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(LoginState()){
    on<LoginEvent>(_onEvent);
  }

  Future<void> _onEvent(LoginEvent event, Emitter<LoginState> emit) async{
    if(event is LoginIdChanged){
      emit(state.copyWith(id: event.id));
    }
    else if(event is LoginPasswordChanged){
      emit(state.copyWith(password: event.password));
    }
    else if(event is LoginSubmitted){
      emit(state.copyWith(formSubmissionStatus: FormSubmitting()));

      try{
        await authRepository.login();
        emit(state.copyWith(formSubmissionStatus: SubmissionSuccess()));
      } catch(e){
        emit(state.copyWith(formSubmissionStatus: SubmissionFailed(e as Exception)));
      }
    }
  }
}