//todo hold data - handle logic (for view)
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical/domain/use_cases/register_use_case.dart';
import 'package:medical/ui/authentication_screens/register/cubit/register_state.dart';

class RegisterScreenViewModel extends Cubit<RegisterState> {
  RegisterScreenViewModel({required this.registerUseCase})
      : super(RegisterInitialState());
  var namelController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var genderController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;
  String? valueChoosen;
  List locationList = ['banha', 'sopra', 'minofia'];
  RegisterUseCase registerUseCase;

  void register() async {
    if (formKey.currentState?.validate() == true) {
      try {
        emit(RegisterLoadingState(loadingMessage: 'Loading......'));
        var responce = await registerUseCase.invoke(
            namelController.text,
            emailController.text,
            passwordController.text,
            phoneController.text,
            genderController.text,
            valueChoosen.toString());
        if (responce.error?.id == '1') {
          emit(RegisterErrorState(errorMessage: responce.message));
        }
        emit(RegisterSuccessState(responce: responce));
      } catch (e) {
        emit(RegisterErrorState(errorMessage: e.toString()));
      }
    }
  }
}
