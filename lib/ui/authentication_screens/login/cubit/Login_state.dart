import 'package:medical/data/model/responce/LoginResonse.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {
  String? loadingMessage;

  LoginLoadingState({this.loadingMessage});
}

class LoginErrorState extends LoginState {
  String? errorMessage;

  LoginErrorState({this.errorMessage});
}

class LoginSuccessState extends LoginState {
  LoginResponse response;

  LoginSuccessState({required this.response});
}
