import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/ui/home_screen/shedule_screen.dart';
import 'package:medical/ui/Widgets/Auth_text_field.dart';
import 'package:medical/ui/home_screen/tabs/Doctors_tabs_handling/appointment_model.dart';
import 'package:medical/ui/home_screen/tabs/nurse_tabs_handling/helpers.dart';
import 'package:medical/ui/home_screen/tabs/nurse_tabs_handling/nurseList.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NurseDetails extends StatefulWidget {
  Helper n;

  NurseDetails({required this.n});

  var dayAppointmentControllerNurse = TextEditingController();
  var timeAppointmentControllerNurse = TextEditingController();

  @override
  _NurseDetailsState createState() => _NurseDetailsState();
}

class _NurseDetailsState extends State<NurseDetails> {
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
                nurseList(
                  image: widget.n.image,
                  name: widget.n.name,
                  numRating: widget.n.rate,
                  splization: widget.n.spalization,
                  location: widget.n.location,
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
                              ? widget.n.details
                              : widget.n.details,
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
                          controller: widget.dayAppointmentControllerNurse,
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
                          controller: widget.timeAppointmentControllerNurse,
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
                                  name: widget.n.name,
                                  specialization: widget.n.spalization,
                                  rate: widget.n.rate,
                                  location: widget.n.location,
                                  day:
                                      widget.dayAppointmentControllerNurse.text,
                                  time: widget
                                      .timeAppointmentControllerNurse.text,
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

  void checkValidate() {
    if (formKey.currentState?.validate() == true) {}
  }
}

/*
 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.11,
                    width: MediaQuery.of(context).size.width * 3,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        date_Select(date: "21", maintext: "Mon"),
                        date_Select(date: "22", maintext: "Tue"),
                        date_Select(date: "23", maintext: "Wed"),
                        date_Select(date: "24", maintext: "Thu"),
                        date_Select(date: "25", maintext: "Fri"),
                        date_Select(date: "26", maintext: "Sat"),
                        date_Select(date: "27", maintext: "Sun"),
                        date_Select(date: "28", maintext: "Mon"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    color: Colors.black12,
                    thickness: 1,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Time select container importing widget from widgets/times_select
                Container(
                  height: MediaQuery.of(context).size.height * 0.2400,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //In main container 2 Columns use
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2500,
                        width: MediaQuery.of(context).size.width * 0.2900,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              time_select(mainText: "09:00 AM"),
                              time_select(mainText: "01:00 AM"),
                              time_select(mainText: "04:00 AM"),
                              time_select(mainText: "07:00 AM"),
                            ]),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2500,
                        width: MediaQuery.of(context).size.width * 0.2500,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              time_select(mainText: "10:00 PM"),
                              time_select(mainText: "02:00 PM"),
                              time_select(mainText: "07:00 PM"),
                              time_select(mainText: "09:00 PM"),
                            ]),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2500,
                        width: MediaQuery.of(context).size.width * 0.2500,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              time_select(mainText: "11:00 AM"),
                              time_select(mainText: "03:00 PM"),
                              time_select(mainText: "08:00 PM"),
                              time_select(mainText: "10:00 AM"),
                            ]),
                      ),
                    ],
                  ),
                ),
              ],
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
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 247, 247, 247),
                            borderRadius: BorderRadius.circular(18),
                            image: const DecorationImage(
                                image: AssetImage(
                                  "lib/icons/Chat.png",
                                ),
                                filterQuality: FilterQuality.high)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: appointment()));
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
 */
/*
 Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.of(context).size.width * 0.1300,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 247, 247, 247),
                                borderRadius: BorderRadius.circular(18),
                                image: const DecorationImage(
                                    image: AssetImage(
                                      "lib/icons/Chat.png",
                                    ),
                                    filterQuality: FilterQuality.high)),
                          ),
 */
