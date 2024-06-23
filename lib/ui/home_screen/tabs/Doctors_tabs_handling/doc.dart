class Doctors {
  String image;
  String name;
  String spalization;
  String location;
  String rate;
  String details;

  Doctors(
      {required this.image,
      required this.name,
      required this.spalization,
      required this.location,
      required this.rate,
      this.details = ''});
}

List<Doctors> doc = [
  Doctors(
      image: 'lib/icons/doctor 5.jpg',
      name: 'Mahmoud',
      spalization: 'Orthopedist',
      location: 'Benha',
      rate: '0.0',
      details:
          'Experienced cardiologist Experienced cardiologist Experienced '),
  Doctors(
      image: "lib/icons/ana.jpg",
      name: 'Gana Ahmed',
      spalization: 'Cardiology',
      location: 'Benha',
      rate: '7.6',
      details: 'Experienced cardiologist'),
  Doctors(
      image: 'lib/icons/doctor 4.jpg',
      name: 'Naira Ahmed',
      spalization: 'Cardiology',
      location: 'Benha',
      rate: '7.3',
      details: 'iam good at Cardiology'),
  Doctors(
      image: 'lib/icons/doctor 5.jpg',
      name: 'Ahlam Ahmed',
      spalization: 'Cardiology',
      location: 'Benha',
      rate: '7.1',
      details: 'iam good at Cardiology'),
  Doctors(
      image: 'lib/icons/aha.jpg',
      name: 'Ahmed Amin',
      spalization: 'Cardiology',
      location: 'KFR SHOKR',
      rate: '6.9',
      details: 'iam good at Cardiology'),
  Doctors(
      image: 'lib/icons/doctor 5.jpg',
      name: 'Habib Hossam',
      spalization: 'Cardiology',
      location: 'KFR SHOKR',
      rate: '6.6',
      details: 'iam good at Cardiology'),
  Doctors(
      image: 'lib/icons/aha.jpg',
      name: 'Eyad Tamer',
      spalization: 'Cardiology',
      location: 'KFR SHOKR',
      rate: '6.3',
      details: 'iam good at Cardiology'),
  Doctors(
      image: 'lib/icons/ana.jpg',
      name: 'Ahmed Adel',
      spalization: 'Cardiology',
      location: 'Tocg',
      rate: '6.0',
      details: 'iam good at Cardiology'),
  Doctors(
      image: 'lib/icons/anan.jpg',
      name: 'Mazen Foad',
      spalization: 'Cardiology',
      location: 'Tocg',
      rate: '5.9',
      details: 'iam good at Cardiology'),
  Doctors(
      image: 'lib/icons/doctor 4.jpg',
      name: 'Nehal Tarek',
      spalization: 'Cardiology',
      location: 'Tocg',
      rate: '5.8',
      details: 'iam good at Cardiology'),
  Doctors(
      image: 'lib/icons/aha.jpg',
      name: 'Adel Foda',
      spalization: 'Orthopedist',
      location: 'Benha',
      rate: '3.5',
      details: 'iam good at Orthopedist'),
];
