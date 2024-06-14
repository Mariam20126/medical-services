import 'package:medical/data/model/responce/RegisterResponce.dart';

abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {
  String? loadingMessage;

  RegisterLoadingState({this.loadingMessage});
}

class RegisterErrorState extends RegisterState {
  String? errorMessage;

  RegisterErrorState({this.errorMessage});
}

class RegisterSuccessState extends RegisterState {
  RegisterResponce responce;

  RegisterSuccessState({required this.responce});
}
