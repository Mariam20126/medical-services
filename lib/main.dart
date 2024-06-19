import 'package:flutter/material.dart';
import 'package:medical/ui/authentication_screens/Splash_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(MyApp());
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
