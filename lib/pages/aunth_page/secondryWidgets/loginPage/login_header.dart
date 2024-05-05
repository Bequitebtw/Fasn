import 'package:fasn/design/colors.dart';
import 'package:fasn/design/dimensions.dart';
import 'package:flutter/material.dart';

class LogHeader extends StatelessWidget {
  const LogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.only(bottom: 24),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Login to your account",
                style: TextStyle(
                    letterSpacing: -1,
                    fontWeight: FontWeight.w600,
                    fontSize: fontSize32,
                    fontFamily: "Poppins",
                    color: blackColor)),
            Text("it`s great to see you again.",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0,
                    fontSize: fontSize16,
                    fontFamily: "Poppins",
                    color: (primary500)))
          ],
        ),
      ),
    );
  }
}
