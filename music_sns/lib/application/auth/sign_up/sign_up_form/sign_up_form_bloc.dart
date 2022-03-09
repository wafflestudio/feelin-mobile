import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_form_event.dart';
part 'sign_up_form_state.dart';

class SignUpFormBloc extends Bloc<SignUpFormEvent, SignUpFormState> {
  SignUpFormBloc() : super(SignUpFormInitial()) {
    on<SignUpFormEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
