import 'package:flutter/material.dart';
import 'package:social_media_app/colors/app_colors.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    super.key,
    required this.icon,
    required this.title,
    this.controller, this.obsecure=false, this.keyboardType,
  });

  final Icon icon;
  final String title;
  final TextEditingController? controller;
  final bool? obsecure;
  final TextInputType? keyboardType;
  

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obsecure!,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          fillColor: kWhiteColor,
          filled: true,
          prefixIcon: icon,
          hintText: title,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(16)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
            borderRadius: BorderRadius.circular(16),
          )),
    );
  }
}
