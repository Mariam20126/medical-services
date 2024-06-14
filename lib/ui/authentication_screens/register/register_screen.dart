//todo view=>build ui
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/data/repository/auth_repository/repository/auth_repository_implementation.dart';
import 'package:medical/domain/use_cases/register_use_case.dart';
import 'package:medical/ui/Widgets/Auth_text_field.dart';
import 'package:medical/ui/Widgets/alart_dialog.dart';
import 'package:medical/ui/authentication_screens/login/login_screen.dart';
import 'package:medical/ui/authentication_screens/register/cubit/register_screen_view_model.dart';
import 'package:medical/ui/authentication_screens/register/cubit/register_state.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  RegisterScreenViewModel viewModel =
      RegisterScreenViewModel(registerUseCase: injectRegisterUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterScreenViewModel, RegisterState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showLoading(context, state.loadingMessage!);
        } else if (state is RegisterErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.errorMessage!,
              posActionName: 'ok', title: 'error occured while registering');
        } else if (state is RegisterSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.responce.user?.name ?? "",
              posActionName: 'ok', title: 'you are successfly registered');
        }
      },
      child: Scaffold(
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
            key: viewModel.formKey,
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
                          controller: viewModel.namelController,
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
                    controller: viewModel.emailController,
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
                    controller: viewModel.passwordController,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'please enter password';
                      }
                      if (text.length < 6 || text.length > 30) {
                        return 'password must be more than 6 numbers and less than 30';
                      }
                    },
                    isPassword: viewModel.isPassword,
                    type: TextInputType.visiblePassword),
                const SizedBox(
                  height: 5,
                ),
                Auth_text_field(
                    text: "Enter your phone",
                    icon: "lib/icons/call.png",
                    controller: viewModel.phoneController,
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
                    controller: viewModel.genderController,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'please enter your gender male or female';
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
                      value: viewModel.valueChoosen,
                      onChanged: (newValue) {
                        setState(() {
                          viewModel.valueChoosen = newValue as String?;
                        });
                      },
                      items: viewModel.locationList.map((valueItem) {
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
                      viewModel.register();
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
      ),
    );
  }
}
