import 'package:fasn/design/colors.dart';
import 'package:fasn/design/dimensions.dart';
import 'package:flutter/material.dart';

class ResetHeader extends StatelessWidget {
  const ResetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.only(bottom: 24),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Forgot password",
                style: TextStyle(
                    letterSpacing: -1,
                    fontWeight: FontWeight.w600,
                    fontSize: fontSize32,
                    fontFamily: "Poppins",
                    color: blackColor)),
            Text(
                "Enter your email for the verification process. We will send 4 digits code to your email.",
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
