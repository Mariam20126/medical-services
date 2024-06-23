import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical/ui/home_screen/cubit/home_screen_state.dart';
import 'package:medical/ui/home_screen/Dashboard_screen.dart';
import 'package:medical/ui/home_screen/Profile_screen.dart';
import 'package:medical/ui/Views/message_tab_all.dart';
import 'package:medical/ui/home_screen/shedule_screen.dart';

class HomeScreenViewModel extends Cubit<HomeState> {
  HomeScreenViewModel() : super(HomeInitialState());
  List<IconData> icons = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.envelope,
    FontAwesomeIcons.clipboardCheck,
    FontAwesomeIcons.user,
  ];
  int page = 0;
  List<Widget> pages = [
    Dashboard(), // You can replace this with your actual pages
    message_tab_all(),
    ScheduleScreen(),
    Profile_screen()
  ];

  void changeBottomNavIndex(int newSelectedIndex) {
    HomeInitialState();
    page = newSelectedIndex;
    emit(HomeChangeBottomNavigationBar());
  }
}
