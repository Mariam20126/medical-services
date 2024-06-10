import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medical/Screens/info_screen/views.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return views();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuerry = MediaQuery.of(context).size;
    return Scaffold(
        body: Image.asset(
      'images/assets/splash.jpg',
      width: mediaQuerry.width,
      height: mediaQuerry.height,
      fit: BoxFit.fill,
    ));
  }
}
