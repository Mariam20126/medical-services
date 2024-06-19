import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class view3 extends StatelessWidget {
  const view3({super.key});
/*
 "the correct diagnosis is \nthree-fourths the remedy",
 */
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Color.fromARGB(255, 89, 138, 128),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 40,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment.bottomCenter,
                      image: AssetImage(
                        "images/assets/doctor3.png",
                      ),
                      filterQuality: FilterQuality.high)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 89, 138, 128),
                          const Color.fromARGB(255, 255, 255, 255),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Text(
                        "the correct diagnosis is \nthree-fourths the remedy",
                        style: GoogleFonts.inter(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 37, 37, 37)),
                      ),
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
