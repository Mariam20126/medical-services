import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/ui/authentication_screens/login/login_screen.dart';
import 'package:medical/ui/authentication_screens/register/register_screen.dart';

import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class start_screen extends StatelessWidget {
  const start_screen({super.key});

  static const String routeName = 'start_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 89, 138, 128),
      body: Column(children: [
        const SizedBox(
          height: 100,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.height * 01,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/assets/logo_1.png"),
                  filterQuality: FilterQuality.high)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Lets get Started!",
              style: GoogleFonts.poppins(
                  fontSize: 22.sp,
                  color: Color.fromARGB(211, 14, 13, 13),
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.7,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft, child: login()));
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 3, 190, 150),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              "Login",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.w500,
                letterSpacing: 0,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(30)),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft, child: register()));
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 255, 255, 255),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              "Sign up",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                color: Color.fromARGB(255, 3, 190, 150),
                fontWeight: FontWeight.w500,
                letterSpacing: 0,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
