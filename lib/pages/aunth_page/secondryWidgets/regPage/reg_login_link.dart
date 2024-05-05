import 'package:fasn/design/colors.dart';
import 'package:fasn/design/dimensions.dart';
import 'package:flutter/material.dart';

class LoginLink extends StatelessWidget {
  const LoginLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 22,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already hane an account?",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: fontSize16,
                  color: primary500,
                  fontFamily: "Poppins"),
            ),
            TextButton(
                style: ButtonStyle(splashFactory: NoSplash.splashFactory),
                onPressed: () =>
                    {Navigator.pushReplacementNamed(context, "/loginRoute")},
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
