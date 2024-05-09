import 'package:fasn/design/colors.dart';
import 'package:fasn/design/dimensions.dart';
import 'package:flutter/material.dart';

class SignUpPolicy extends StatelessWidget {
  const SignUpPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: RichText(
            text: TextSpan(
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: fontSize14,
                    color: primary900,
                    fontFamily: "Poppins"),
                children: [
          TextSpan(text: "By signing up you agree to our "),
          TextSpan(
              text: "Terms, Privacy Policy",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w500)),
          TextSpan(
            text: " and ",
          ),
          TextSpan(
              text: "Cookie Use",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w500))
        ])));
  }
}
