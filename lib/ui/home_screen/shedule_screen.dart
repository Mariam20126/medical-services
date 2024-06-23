import 'package:flutter/material.dart';
import 'package:medical/ui/home_screen/Homepage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'tabs/Doctors_tabs_handling/appointment_model.dart';

class ScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appointments = Provider.of<AppointmentModel>(context).appointments;

    return Scaffold(
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
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: Color.fromARGB(255, 89, 138, 128),
        title: Text('Our Reservied Doctors\n          AND Nurses'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: appointments.length,
          itemBuilder: (context, index) {
            final appointment = appointments[index];
            return Card(
              child: ListTile(
                  title: Text(
                      '${appointment.name} - ${appointment.specialization}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Rate: ${appointment.rate}'),
                      Text('Location: ${appointment.location}'),
                      Text('Day: ${appointment.day}'),
                      Text('Time: ${appointment.time}'),
                    ],
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {
                      Provider.of<AppointmentModel>(context, listen: false)
                          .removeAppointment(appointment);
                    },
                    child: Text("remove"),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 89, 138, 128),
                      // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30.0), // Circular border
                      ),
                    ),
                  )),
            );
          },
        ),
      ),
    );
  }
}

/*
 onPressed: () {
                    Provider.of<AppointmentModel>(context, listen: false)
                        .removeAppointment(appointment);
                  },
 */

/*
import 'package:flutter/material.dart';
import 'package:medical/ui/home_screen/tabs/Doctors_tabs_handling/AppointmentNurseModel.dart';
import 'package:provider/provider.dart';

class ScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appointment = Provider.of<AppointmentModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${appointment.name}', style: TextStyle(fontSize: 18)),
            Text('Specialization: ${appointment.specialization}', style: TextStyle(fontSize: 18)),
            Text('Rate: ${appointment.rate}', style: TextStyle(fontSize: 18)),
            Text('Location: ${appointment.location}', style: TextStyle(fontSize: 18)),
            Text('Day: ${appointment.day}', style: TextStyle(fontSize: 18)),
            Text('Time: ${appointment.time}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                appointment.clearAppointment();
                Navigator.pop(context);
              },
              child: Text('Cancel Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}
 */
/*
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/ui/home_screen/tabs/Doctors_tabs_handling/shedule_tab1.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class ScheduleScreen extends StatefulWidget {
  @override
  _TabBarExampleState createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<ScheduleScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 89, 138, 128),
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
          "your doctor and nurses",
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 18.sp),
        ),
        centerTitle: false,
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 00),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Expanded(
                        child: TabBarView(
                            controller: tabController,
                            children: const [
                          shedule_tab1(),
                        ]))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
 */
