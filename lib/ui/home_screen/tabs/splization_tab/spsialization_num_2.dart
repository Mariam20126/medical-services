import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/ui/home_screen/Homepage.dart';
import 'package:medical/ui/home_screen/tabs/Doctors_tabs_handling/doctorList.dart';
import 'package:medical/ui/home_screen/tabs/splization_tab/spsialization_list_2.dart';
import 'package:medical/ui/home_screen/tabs/splization_tab/spsialization_number_two_details.dart';
import 'package:page_transition/page_transition.dart';

class SpsializationNumberTwo extends StatefulWidget {
  const SpsializationNumberTwo({super.key});

  @override
  State<SpsializationNumberTwo> createState() => _SpsializationNumberTwoState();
}

class _SpsializationNumberTwoState extends State<SpsializationNumberTwo> {
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
              "our Doctors in Orthopedist",
              style: GoogleFonts.poppins(color: Colors.black, fontSize: 18.sp),
            ),
            centerTitle: true,
            elevation: 0,
            toolbarHeight: 100,
            backgroundColor: Colors.white,
          ),
          body: ListView.builder(
            itemCount: ds2.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SpsializationNumberTwoDetails(
                                spisializationTwo: ds2[index],
                              )));
                },
                child: doctorList(
                  image: ds2[index].image,
                  name: ds2[index].name,
                  numRating: ds2[index].rate,
                  splization: ds2[index].spalization,
                  location: ds2[index].location,
                ),
              );
            },
          )),
    );
  }
}
