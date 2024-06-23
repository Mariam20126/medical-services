import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/ui/home_screen/tabs/Doctors_tabs_handling/doctors.dart';
import 'package:medical/ui/Widgets/banner.dart';
import 'package:medical/ui/Widgets/list_doctor1.dart';
import 'package:medical/ui/Widgets/listicons.dart';
import 'package:medical/ui/home_screen/tabs/nurse_tabs_handling/nurses_tab.dart';
import 'package:medical/ui/home_screen/tabs/service_tab/available_service.dart';
import 'package:medical/ui/home_screen/tabs/splization_tab/available_spsilization.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 89, 138, 128),
        title: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "Find your desire\nmedical provider",
              style: GoogleFonts.inter(
                  color: Color.fromARGB(255, 51, 47, 47),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1),
            ),
          ],
        ),
        toolbarHeight: 130,
        elevation: 0,
      ),
      backgroundColor: Color.fromARGB(255, 89, 138, 128),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 20,
          ), //Body Start fro here
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: Doctor()));
                  },
                  child:
                      listIcons(Icon: "lib/icons/Doctor.png", text: "Doctor")),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: Nurse_tab()));
                  },
                  child: listIcons(
                      Icon: "lib/icons/Nurse Male.png", text: "Nurse")),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: ServicesPage()));
                  },
                  child: listIcons(
                      Icon: "lib/icons/Category.png", text: "service")),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: SpilizationPage()));
                  },
                  child: listIcons(
                      Icon: "lib/icons/Syringe with a drop of blood.png",
                      text: "specialization")),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          const banner(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Doctors",
                  style: GoogleFonts.inter(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 46, 46, 46),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              height: 180,
              width: 400,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  list_doctor1(
                      image: "lib/icons/aha.jpg",
                      maintext: "Dr. Marcus Horizon",
                      rate: "6.4",
                      subtext: "Chardiologist"),
                  list_doctor1(
                      image: "lib/icons/ana.jpg",
                      maintext: "Dr. Maria Elena",
                      rate: "5.2",
                      subtext: "Psychologist"),
                  list_doctor1(
                      image: "lib/icons/anan.jpg",
                      maintext: "Dr. Stevi Jessi",
                      rate: "5.1",
                      subtext: "Orthopedist"),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Nurses",
                  style: GoogleFonts.inter(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 46, 46, 46),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              height: 180,
              width: 400,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  list_doctor1(
                      image: "lib/icons/nurse 1.jpg",
                      maintext: "Dr. Marcus Horizon",
                      rate: "6.0",
                      subtext: "Chardiologist"),
                  list_doctor1(
                      image: "lib/icons/nurse 2.jpg",
                      maintext: "Dr. Maria Elena",
                      rate: "5.6",
                      subtext: "Psychologist"),
                  list_doctor1(
                      image: "lib/icons/nurse 3.jpg",
                      maintext: "Dr. Stevi Jessi",
                      rate: "5.8",
                      subtext: "Orthopedist"),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
