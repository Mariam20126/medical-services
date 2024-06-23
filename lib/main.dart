import 'package:flutter/material.dart';
import 'package:medical/ui/authentication_screens/Splash_screen.dart';
import 'package:medical/ui/home_screen/tabs/Doctors_tabs_handling/appointment_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (BuildContext context) => AppointmentModel()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash(),
      );
    });
  }
}
