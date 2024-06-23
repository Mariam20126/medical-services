import 'package:medical/data/model/responce/Doctor.dart';

abstract class DoctorsState {}

class DoctorTabInitialState extends DoctorsState {}

class DoctorTabCategoryLoadingState extends DoctorsState {
  String? loadingMessage;

  DoctorTabCategoryLoadingState({this.loadingMessage});
}

class DoctorTabCategoryErrorState extends DoctorsState {
  String? errorMessage;

  DoctorTabCategoryErrorState({this.errorMessage});
}

class DoctorTabCategorySuccessState extends DoctorsState {
  Doctor response;

  DoctorTabCategorySuccessState({required this.response});
}
