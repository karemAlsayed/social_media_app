import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:social_media_app/colors/app_colors.dart';
import 'package:social_media_app/screens/auth/login_page.dart';
import 'package:social_media_app/services/auth.dart';
import 'package:social_media_app/widgets/login_button.dart';
import 'package:social_media_app/widgets/login_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController displaycontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  register() async {
    try {
      String res = await AuthMethods().signUp(
          email: emailcontroller.text,
          password: passwordcontroller.text,
          username: usernamecontroller.text,
          name: displaycontroller.text);
      if (res == 'success') {
      } else {
        // ignore: avoid_print
        print(res);
      }
    } on Exception catch (e) {
      // ignore: avoid_print
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
                 LoginTextField(icon: const Icon(Icons.person), title: 'Name',controller: displaycontroller,),
                const Gap(20),
                 LoginTextField(
                    icon: const Icon(Icons.password_outlined), title: 'Username',controller: usernamecontroller,),
                const Gap(20),
                 LoginTextField(
                    icon: const Icon(Icons.email_outlined), title: 'Email',controller: emailcontroller,),
                const Gap(20),
                 LoginTextField(
                    icon: const Icon(Icons.password_outlined), title: 'Password',obsecure: true,controller: passwordcontroller,),
                const Gap(20),
                LoginButton(
                    ontap: () {
                      register();
                    },
                    title: 'Register'),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(
                            builder: (context) {
                              return const LoginScreen();
                            },
                          ), (route) => false);
                        },
                        child: Text(
                          'Login',
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
