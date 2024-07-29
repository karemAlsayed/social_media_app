


import 'package:flutter/material.dart';
import 'package:social_media_app/colors/app_colors.dart';

// ignore: must_be_immutable
class LoginButton extends StatelessWidget {
  LoginButton({super.key, required this.title, required this.ontap});
  final String title;
  void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: ontap,
            style: ElevatedButton.styleFrom(
                backgroundColor: kSecondaryColor,
                padding: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16))),
            child: Text(
              title.toUpperCase(),
              style: TextStyle(color: kWhiteColor),
            ),
          ),
        ),
      ],
    );
  }
}
