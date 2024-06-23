//todo hold data - handle logic (for view)
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical/domain/use_cases/register_use_case.dart';
//import 'package:medical/ui/authentication_screens/register/cubit/Login_state.dart';

import '../../../../domain/use_cases/login_use_case.dart';
import 'Login_state.dart';

class LoginScreenViewModel extends Cubit<LoginState> {
  LoginScreenViewModel({required this.loginUseCase})
      : super(LoginInitialState());
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  bool isPassword = true;
  LoginUseCase loginUseCase;

  void login() async {
    if (formKey.currentState?.validate() == true) {
      try {
        emit(LoginLoadingState(loadingMessage: 'Loading......'));
        var response = await loginUseCase.invoke(
            emailController.text, passwordController.text);
        if (response.error?.message == '') {
          emit(LoginErrorState(errorMessage: response.error?.message));
        }
        emit(LoginSuccessState(response: response));
      } catch (e) {
        emit(LoginErrorState(errorMessage: e.toString()));
      }
    }
  }
}
