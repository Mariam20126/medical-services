import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical/data/model/responce/Doctor.dart';
import 'package:medical/domain/use_cases/get_all_doctors_use_case.dart';
import 'package:medical/ui/home_screen/tabs/cubit/doctors_states.dart';

class DoctorsTabViewModel extends Cubit<DoctorsState> {
  GetAllDoctorsUseCase getAllCategoriesUseCase;
  List<Doctor>? doctorList;

  DoctorsTabViewModel({required this.getAllCategoriesUseCase})
      : super(DoctorTabInitialState());

  void getCategories() async {
    try {
      emit(DoctorTabCategoryLoadingState());
      var response = await getAllCategoriesUseCase.invoke();
      if (response.statusCode == '404') {
        emit(DoctorTabCategoryErrorState(errorMessage: response.message));
      }
      doctorList = response.description ?? [];
      emit(DoctorTabCategorySuccessState(response: response));
    } catch (e) {
      emit(DoctorTabCategoryErrorState(errorMessage: e.toString()));
    }
  }
}
