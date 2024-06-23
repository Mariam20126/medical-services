class DoctorsSpisializationTwo {
  String image;
  String name;
  String spalization;
  String location;
  String rate;
  String details;

  DoctorsSpisializationTwo(
      {required this.image,
      required this.name,
      required this.spalization,
      required this.location,
      required this.rate,
      this.details = ''});
}

List<DoctorsSpisializationTwo> ds2 = [
  DoctorsSpisializationTwo(
      image: 'lib/icons/doctor 5.jpg',
      name: 'Mahmoud',
      spalization: 'Orthopedist',
      location: 'Benha',
      rate: '0.0',
      details:
          'Experienced cardiologist Experienced cardiologist Experienced '),
  DoctorsSpisializationTwo(
      image: 'lib/icons/aha.jpg',
      name: 'Adel Foda',
      spalization: 'Orthopedist',
      location: 'Benha',
      rate: '3.5',
      details: 'iam good at Orthopedist')
];
