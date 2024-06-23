import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/ui/home_screen/tabs/Doctors_tabs_handling/doctorList.dart';
import 'package:medical/ui/home_screen/Homepage.dart';
import 'package:medical/ui/home_screen/tabs/splization_tab/spsialization_list.dart';
import 'package:medical/ui/home_screen/tabs/splization_tab/spsialization_number_one_details.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SpsializationNumberOne extends StatefulWidget {
  @override
  State<SpsializationNumberOne> createState() => _SpsializationNumberOneState();
}

class _SpsializationNumberOneState extends State<SpsializationNumberOne> {
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
              "our Doctors in Cardiology",
              style: GoogleFonts.poppins(color: Colors.black, fontSize: 18.sp),
            ),
            centerTitle: true,
            elevation: 0,
            toolbarHeight: 100,
            backgroundColor: Colors.white,
          ),
          body: ListView.builder(
            itemCount: ds1.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SpsializationNumberOneDetails(
                                spsialization: ds1[index],
                              )));
                },
                child: doctorList(
                  image: ds1[index].image,
                  name: ds1[index].name,
                  numRating: ds1[index].rate,
                  splization: ds1[index].spalization,
                  location: ds1[index].location,
                ),
              );
            },
          )),
    );
  }
}
