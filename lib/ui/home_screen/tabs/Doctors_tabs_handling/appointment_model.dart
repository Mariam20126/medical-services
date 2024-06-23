import 'package:flutter/foundation.dart';

class Appointment {
  final String name;
  final String specialization;
  final String rate;
  final String location;
  final String day;
  final String time;

  Appointment({
    required this.name,
    required this.specialization,
    required this.rate,
    required this.location,
    required this.day,
    required this.time,
  });
}

class AppointmentModel extends ChangeNotifier {
  List<Appointment> _appointments = [];

  List<Appointment> get appointments => _appointments;

  void addAppointment(Appointment appointment) {
    _appointments.add(appointment);
    notifyListeners();
  }

  void removeAppointment(Appointment appointment) {
    _appointments.remove(appointment);
    notifyListeners();
  }
}
