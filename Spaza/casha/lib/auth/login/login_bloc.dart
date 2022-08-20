import 'package:casha/auth/form_submission_status.dart';
import 'package:casha/auth/login/login_event.dart';
import 'package:casha/auth/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../auth_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo;

  LoginBloc({required this.authRepo}) : super(LoginState());

  //@override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    // Username Updated
    if (event is LoginUsernameChanged) {
      yield state.copyWith(username: event.username);

      // Password Updated
    } else if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);

      // Form Submitted
    } else if (event is LoginSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await authRepo.login();
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (exception) {
        yield state.copyWith(formStatus: SubmissionFailed(exception: null));
      }
    }
  }
}
