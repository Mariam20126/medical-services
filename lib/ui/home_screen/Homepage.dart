import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical/ui/home_screen/cubit/home_screen_state.dart';
import 'package:medical/ui/home_screen/cubit/home_screen_view_model.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  HomeScreenViewModel homeScreenViewModel = HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenViewModel, HomeState>(
      bloc: homeScreenViewModel,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color.fromARGB(255, 89, 138, 128),
          body: homeScreenViewModel.pages[homeScreenViewModel.page],
          // Display the selected page
          bottomNavigationBar: AnimatedBottomNavigationBar(
            elevation: 15,
            shadow: BoxShadow(color: Colors.black),
            backgroundColor: Color.fromARGB(255, 89, 138, 128),
            icons: homeScreenViewModel.icons,
            iconSize: 20,
            activeIndex: homeScreenViewModel.page,
            height: 80,
            splashSpeedInMilliseconds: 300,
            gapLocation: GapLocation.none,
            activeColor: const Color.fromARGB(255, 0, 190, 165),
            inactiveColor: const Color.fromARGB(255, 223, 219, 219),
            onTap: (tappedIndex) {
              homeScreenViewModel.changeBottomNavIndex(tappedIndex);
            },
          ),
        );
      },
    );
  }
}
