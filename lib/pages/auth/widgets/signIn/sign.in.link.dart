import 'package:fasn/design/colors.dart';
import 'package:fasn/design/dimensions.dart';
import 'package:flutter/material.dart';

class SignInLink extends StatelessWidget {
  const SignInLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 22,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don`t have an account? ",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: fontSize16,
                  color: primary500,
                  fontFamily: "Poppins"),
            ),
            InkWell(
                onTap: () => {Navigator.pushNamed(context, '/SignUpRoute')},
                child: Text(
                  "Join",
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
