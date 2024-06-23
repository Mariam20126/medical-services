import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/ui/Widgets/Auth_text_field.dart';
import 'package:medical/ui/authentication_screens/forget_password/forget_password_screen.dart';
import 'package:medical/ui/authentication_screens/register/register_screen.dart';
import 'package:medical/ui/authentication_screens/start_screen.dart';
import 'package:medical/ui/home_screen/Homepage.dart';

import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/use_cases/login_use_case.dart';
import '../../Widgets/alart_dialog.dart';
import 'cubit/Login_screen_view_model.dart';
import 'cubit/Login_state.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  LoginScreenViewModel viewModel =
      LoginScreenViewModel(loginUseCase: injectLoginUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginScreenViewModel, LoginState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(context, state.loadingMessage!);
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context,
            state.errorMessage!,
            posActionName: 'ok',
            title: 'error occured while logging',
          );
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context,
            state.response.user?.name ?? "",
            posActionName: 'ok',
            title: 'you are successfly loginned',
            posAction: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight, child: Homepage()));
            },
          );
        }
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 89, 138, 128),
        appBar: AppBar(
          leading: IconButton(
            icon: Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.06,
                child: Image.asset("lib/icons/back2.png")),
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight,
                      child: start_screen()));
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            "Login",
            style: GoogleFonts.inter(
                color: Colors.black87,
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                letterSpacing: 0),
          ),
          toolbarHeight: 110,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: viewModel.formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(children: [
                Image.asset('images/assets/logo_1.png'),
                Auth_text_field(
                    text: "Enter you email",
                    icon: "lib/icons/email.png",
                    controller: viewModel.emailController,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'please enter valid email';
                      }
                    },
                    type: TextInputType.emailAddress),
                const SizedBox(
                  height: 5,
                ),
                //Text field Password
                Auth_text_field(
                    isPassword: true,
                    text: "Enter your password",
                    icon: "lib/icons/lock.png",
                    controller: viewModel.passwordController,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'please enter valid password';
                      }
                    },
                    type: TextInputType.text),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  /*
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.leftToRight,
                              child: forget_password()));
                    },
                    child: Text(
                      "Forgot your password?",
                      style: GoogleFonts.poppins(
                          fontSize: 18.sp,
                          color: const Color.fromARGB(255, 3, 190, 150),
                          fontWeight: FontWeight.w500),
                    ),
                  )
                   */
                ]),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ElevatedButton(
                    onPressed: () {
                      viewModel.login();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 3, 190, 150),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: Homepage()));
                      },
                      child: Text(
                        "Login",
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
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: GoogleFonts.poppins(
                          fontSize: 15.sp, color: Colors.black87),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: register()));
                      },
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.poppins(
                          fontSize: 15.sp,
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

  void login() {
    viewModel.login();

    ///login
  }
}
