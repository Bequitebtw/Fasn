import 'package:fasn/design/colors.dart';
import 'package:fasn/design/dimensions.dart';
import 'package:flutter/material.dart';

class SignUpLink extends StatelessWidget {
  const SignUpLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 22,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already hane an account? ",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: fontSize16,
                  color: primary500,
                  fontFamily: "Poppins"),
            ),
            InkWell(
                onTap: () =>
                    {Navigator.pushReplacementNamed(context, "/SignInRoute")},
                child: Text(
                  "Log In",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: fontSize16,
                      color: primary900,
                      fontFamily: "Poppins",
                      decoration: TextDecoration.underline),
                ))
          ],
        ));
  }
}
