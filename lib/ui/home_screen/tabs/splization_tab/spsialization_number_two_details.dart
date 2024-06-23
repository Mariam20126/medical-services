import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/ui/Widgets/Auth_text_field.dart';
import 'package:medical/ui/home_screen/shedule_screen.dart';
import 'package:medical/ui/home_screen/tabs/Doctors_tabs_handling/appointment_model.dart';
import 'package:medical/ui/home_screen/tabs/Doctors_tabs_handling/doctorList.dart';
import 'package:medical/ui/home_screen/tabs/splization_tab/spsialization_list_2.dart';
import 'package:provider/provider.dart';

class SpsializationNumberTwoDetails extends StatefulWidget {
  DoctorsSpisializationTwo spisializationTwo;

  SpsializationNumberTwoDetails({required this.spisializationTwo});

  var dayAppointmentController = TextEditingController();
  var timeAppointmentController = TextEditingController();

  @override
  State<SpsializationNumberTwoDetails> createState() =>
      _SpsializationNumberTwoDetailsState();
}

class _SpsializationNumberTwoDetailsState
    extends State<SpsializationNumberTwoDetails> {
  bool showExtendedText = false;
  bool _showAppointments = false;

  void toggleTextVisibility() {
    setState(() {
      showExtendedText = !showExtendedText;
    });
  }

  void _toggleAppointments() {
    setState(() {
      _showAppointments = !_showAppointments;
    });
  }

  @override
  var formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
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
            "",
            style: GoogleFonts.poppins(color: Colors.black, fontSize: 18.sp),
          ),
          centerTitle: true,
          elevation: 0,
          toolbarHeight: 100,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 10,
                width: 10,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("lib/icons/more.png"),
                )),
              ),
            ),
          ],
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Stack(alignment: Alignment.bottomCenter, children: [
            Column(
              children: [
                doctorList(
                  image: widget.spisializationTwo.image,
                  name: widget.spisializationTwo.name,
                  numRating: widget.spisializationTwo.rate,
                  splization: widget.spisializationTwo.spalization,
                  location: widget.spisializationTwo.location,
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: toggleTextVisibility,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "About",
                          style: GoogleFonts.poppins(
                              fontSize: 18.sp, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          showExtendedText
                              ? widget.spisializationTwo.details
                              : widget.spisializationTwo.details,
                          style: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 37, 37, 37),
                            fontSize: 14.sp,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        /*
                        Text(
                          showExtendedText ? "Read less" : "Read more",
                          style: TextStyle(
                            color: showExtendedText
                                ? Color.fromARGB(255, 1, 128, 111)
                                : Color.fromARGB(255, 1, 128,
                                    111), // Change color based on visibility
                          ),),
                         */
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: _toggleAppointments,
                  style: ElevatedButton.styleFrom(
                    primary: _showAppointments
                        ? Colors.white
                        : Color.fromARGB(255, 89, 138, 128),
                    onPrimary: _showAppointments
                        ? Color.fromARGB(255, 89, 138, 128)
                        : Colors.white,
                  ),
                  child: Text(_showAppointments
                      ? "Hide Available Appointments"
                      : "Show Available Appointments"),
                ),
                if (_showAppointments)
                  Column(
                    children: [
                      _buildAppointmentContainer('MON :FROM 5AM TO 6BM'),
                      _buildAppointmentContainer(' MON :FROM 5AM TO 6BM'),
                      _buildAppointmentContainer(' MON :FROM 5AM TO 6BM'),
                    ],
                  ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Auth_text_field(
                          text: 'enter the day you choose',
                          icon: "lib/icons/pencil.png",
                          controller: widget.dayAppointmentController,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'please enter the day of your choice';
                            }
                          },
                          type: TextInputType.emailAddress),
                      SizedBox(
                        height: 20,
                      ),
                      Auth_text_field(
                          text: 'enter the time you choose',
                          icon: "lib/icons/watch.png",
                          controller: widget.timeAppointmentController,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'please enter time of your choice';
                            }
                          },
                          type: TextInputType.datetime),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 80,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.of(context).size.width * 0.1300,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (formKey.currentState?.validate() == true) {
                                final appointment = Appointment(
                                  name: widget.spisializationTwo.name,
                                  specialization:
                                      widget.spisializationTwo.spalization,
                                  rate: widget.spisializationTwo.rate,
                                  location: widget.spisializationTwo.location,
                                  day: widget.dayAppointmentController.text,
                                  time: widget.timeAppointmentController.text,
                                );
                                Provider.of<AppointmentModel>(context,
                                        listen: false)
                                    .addAppointment(appointment);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ScheduleScreen()));
                              }
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.6300,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 2, 179, 149),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Book Appointment",
                                      style: GoogleFonts.poppins(
                                          fontSize: 15.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ]),
                            ),
                          ),
                        ]),
                  ),
                ),
              ],
            )
          ]),
        ));
  }
}

void _onAppointmentTap(String appointment) {
  // Handle appointment tap
}

Widget _buildAppointmentContainer(String appointment) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    padding: EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 89, 138, 128),
      borderRadius: BorderRadius.circular(8.0),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 4.0,
          offset: Offset(2, 2),
        ),
      ],
    ),
    child: Text(
      appointment,
      style: TextStyle(fontSize: 18.0),
    ),
  );
}
