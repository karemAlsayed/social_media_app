// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:social_media_app/colors/app_colors.dart';
import 'package:social_media_app/layout.dart';
import 'package:social_media_app/screens/auth/register_page.dart';
import 'package:social_media_app/services/auth.dart';
import 'package:social_media_app/widgets/login_button.dart';
import 'package:social_media_app/widgets/login_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  signIn()async {
    // ignore: unused_local_variable
    try {
      String res =await AuthMethods().signIn(
          email: emailcontroller.text, password: passwordcontroller.text);
      if (res == 'success') {
        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(
                            builder: (context) {
                              return const LayoutPage();
                            },
                          ), (route) => false);
      } else {
        print(res);
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SvgPicture.asset(
                    'assets/n_logo.svg',
                    colorFilter:
                        ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
                    height: 150,
                    width: 150,
                  ),
                ),
                const Gap(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      '06',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      '16',
                      style: TextStyle(
                          fontSize: 26,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const Gap(20),
                const Text('Welcome Back', style: TextStyle(fontSize: 18)),
                const Gap(20),
                LoginTextField(
                    icon: const Icon(Icons.email_outlined),
                    title: 'Email',
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress),
                const Gap(20),
                LoginTextField(
                    icon: const Icon(Icons.password_outlined),
                    title: 'Password',
                    controller: passwordcontroller,
                    obsecure: true),
                const Gap(20),
                LoginButton(
                    ontap: () {
                      signIn();
                    },
                    title: 'login'),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(
                            builder: (context) {
                              return const RegisterPage();
                            },
                          ), (route) => false);
                        },
                        child: Text(
                          'Register now',
                          style: TextStyle(color: kPrimaryColor),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
