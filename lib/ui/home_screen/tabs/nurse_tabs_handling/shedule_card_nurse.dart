import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/ui/home_screen/tabs/Doctors_tabs_handling/appointment_model.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class shedule_card_Nurse extends StatelessWidget {
  final String name;
  final String spsialization;
  final String day;
  final String time;
  final String confirmation;

  shedule_card_Nurse({
    required this.name,
    required this.spsialization,
    required this.day,
    required this.confirmation,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final appointment = Provider.of<AppointmentModel>(context);
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.22,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 89, 138, 128),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black12),
        ),
        child: Column(children: [
          Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.6,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nr/: ${name}',
                          style: GoogleFonts.poppins(
                              fontSize: 17.sp, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          spsialization,
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.03,
            width: MediaQuery.of(context).size.width * 0.8500,
            child: Row(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.03,
                width: MediaQuery.of(context).size.width * 0.07,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/icons/callender2.png"),
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
              Text(
                day,
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.03,
                width: MediaQuery.of(context).size.width * 0.07,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/icons/watch.png"),
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
              Text(
                time,
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.03,
                width: MediaQuery.of(context).size.width * 0.07,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/icons/elips.png"),
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
              Text(
                confirmation,
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.04500,
                  width: MediaQuery.of(context).size.width * 0.3800,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 232, 233, 233),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            /*
                            appointment.clearAppointment();
                            Navigator.pop(context);
                             */
                          },
                          child: Text(
                            "Cancel",
                            style: GoogleFonts.poppins(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 61, 61, 61)),
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
