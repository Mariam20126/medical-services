import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/Screens/Widgets/Auth_text_field.dart';
import 'package:medical/Screens/authentication_screens//login_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  var formKeySign = GlobalKey<FormState>();
  String? valueChoosen;
  List locationList = ['banha', 'sopra', 'minofia'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 89, 138, 128),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.06,
              child: Image.asset("lib/icons/back2.png")),
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.leftToRight, child: login()));
          },
        ),
        title: Text(
          "Sign up",
          style: GoogleFonts.inter(
              color: Colors.black87,
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 0),
        ),
        toolbarHeight: 110,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKeySign,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(children: [
              Center(
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Auth_text_field(
                        text: "Enter your name",
                        icon: "lib/icons/person.png",
                        controller: TextEditingController(),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'please enter your name';
                          }
                        },
                        type: TextInputType.emailAddress)),
              ),
              const SizedBox(
                height: 5,
              ),
              Auth_text_field(
                  text: "Enter your email",
                  icon: "lib/icons/email.png",
                  controller: TextEditingController(),
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'please enter email';
                    }
                    var emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(text);
                    if (!emailValid) {
                      return '''email format is not vaild ,email must have
                         @ sign and .(com ,yaho ,etc)''';
                    }
                  },
                  type: TextInputType.emailAddress),
              const SizedBox(
                height: 5,
              ),
              Auth_text_field(
                  text: "Enter your password",
                  icon: "lib/icons/lock.png",
                  controller: TextEditingController(),
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'please enter password';
                    }
                    if (text.length < 6 || text.length > 30) {
                      return 'password must be more than 6 numbers and less than 30';
                    }
                  },
                  isPassword: true,
                  type: TextInputType.visiblePassword),
              const SizedBox(
                height: 5,
              ),
              Auth_text_field(
                  text: "Enter your phone",
                  icon: "lib/icons/call.png",
                  controller: TextEditingController(),
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'please enter phone number';
                    }
                    if (text.length < 11) {
                      return 'enter valid phone number';
                    }
                  },
                  type: TextInputType.emailAddress),
              const SizedBox(
                height: 5,
              ),
              Auth_text_field(
                  text: "Enter your gender",
                  icon: "lib/icons/Gender.png",
                  controller: TextEditingController(),
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'please enter your gender';
                    }
                    if (text != 'male' || text != 'female') {
                      return 'enter male or female';
                    }
                  },
                  type: TextInputType.emailAddress),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 5),
                      borderRadius: BorderRadius.circular(25)),
                  child: DropdownButton(
                    focusColor: Colors.white,
                    underline: SizedBox(),
                    hint: Text('choose your area'),
                    dropdownColor: Colors.white,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                      size: 30,
                    ),
                    isExpanded: true,
                    iconSize: 20,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    value: valueChoosen,
                    onChanged: (newValue) {
                      setState(() {
                        valueChoosen = newValue as String?;
                      });
                    },
                    items: locationList.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    signUp();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 3, 190, 150),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Create account",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: GoogleFonts.poppins(
                        fontSize: 14.sp, color: Colors.black87),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.bottomToTop,
                              child: login()));
                    },
                    child: Text(
                      "Sign in",
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: const Color.fromARGB(255, 3, 190, 150),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void signUp() {
    if (!formKeySign.currentState!.validate()) return;

    ///sign up
  }
}
