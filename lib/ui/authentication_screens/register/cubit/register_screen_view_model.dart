//todo hold data - handle logic (for view)
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical/domain/use_cases/register_use_case.dart';
import 'package:medical/ui/authentication_screens/register/cubit/register_state.dart';

class RegisterScreenViewModel extends Cubit<RegisterState> {
  RegisterScreenViewModel({required this.registerUseCase})
      : super(RegisterInitialState());
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var genderController = TextEditingController();
  String dropDownValue = "one";

  bool isPassword = true;
  RegisterUseCase registerUseCase;

  void register() async {
    if (formKey.currentState?.validate() == true) {
      try {
        emit(RegisterLoadingState(loadingMessage: 'Loading......'));
        var response = await registerUseCase.invoke(
            nameController.text,
            emailController.text,
            passwordController.text,
            phoneController.text,
            genderController.text,
            dropDownValue);
        if (response.error?.message == 'User with this email already exists') {
          emit(RegisterErrorState(errorMessage: response.error?.message));
        }
        emit(RegisterSuccessState(response: response));
      } catch (e) {
        emit(RegisterErrorState(errorMessage: e.toString()));
      }
    }
  }
}

/*
  String dropDownValue="one";
 */