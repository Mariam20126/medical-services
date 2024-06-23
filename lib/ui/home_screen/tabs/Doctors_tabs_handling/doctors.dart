import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/ui/home_screen/tabs/Doctors_tabs_handling/doc.dart';
import 'package:medical/ui/home_screen/tabs/Doctors_tabs_handling/doctorList.dart';
import 'package:medical/ui/home_screen/Homepage.dart';
import 'package:medical/ui/home_screen/tabs/Doctors_tabs_handling/doctor_details_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Doctor extends StatefulWidget {
  @override
  State<Doctor> createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
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
              "our Doctors",
              style: GoogleFonts.poppins(color: Colors.black, fontSize: 18.sp),
            ),
            centerTitle: true,
            elevation: 0,
            toolbarHeight: 100,
            backgroundColor: Colors.white,
          ),
          body: ListView.builder(
            itemCount: doc.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DoctorDetails(d: doc[index])));
                },
                child: doctorList(
                  image: doc[index].image,
                  name: doc[index].name,
                  numRating: doc[index].rate,
                  splization: doc[index].spalization,
                  location: doc[index].location,
                ),
              );
            },
          )),
    );
  }
}
