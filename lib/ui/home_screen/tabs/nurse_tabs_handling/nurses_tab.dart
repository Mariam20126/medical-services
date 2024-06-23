import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/ui/home_screen/tabs/Doctors_tabs_handling/doc.dart';
import 'package:medical/ui/home_screen/Homepage.dart';
import 'package:medical/ui/home_screen/tabs/nurse_tabs_handling/nurseList.dart';
import 'package:medical/ui/home_screen/tabs/nurse_tabs_handling/helpers.dart';
import 'package:medical/ui/home_screen/tabs/nurse_tabs_handling/nurse_details_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Nurse_tab extends StatefulWidget {
  @override
  State<Nurse_tab> createState() => _Nurse_tabState();
}

class _Nurse_tabState extends State<Nurse_tab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade, child: Homepage()));
              },
              child: Container(
                height: 10,
                width: 10,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("lib/icons/back1.png"),
                )),
              ),
            ),
            title: Text(
              "our Nurses",
              style: GoogleFonts.poppins(color: Colors.black, fontSize: 18.sp),
            ),
            centerTitle: true,
            elevation: 0,
            toolbarHeight: 100,
            backgroundColor: Colors.white,
          ),
          body: ListView.builder(
            itemCount: help.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NurseDetails(
                                n: help[index],
                              )));
                },
                child: nurseList(
                  image: help[index].image,
                  name: help[index].name,
                  numRating: help[index].rate,
                  splization: help[index].spalization,
                  location: help[index].location,
                ),
              );
            },
          )),
    );
  }
}
