import 'package:fasn/design/colors.dart';
import 'package:fasn/design/dimensions.dart';
import 'package:fasn/pages/auth/screen/reset.screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignInReset extends StatelessWidget {
  const SignInReset({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 22,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Forgot yout password? ",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: fontSize14,
                  color: primary500,
                  fontFamily: "Poppins"),
            ),
            InkWell(
                onTap: () => {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const ResetScreen()))
                    },
                child: Text(
                  "Reset your password",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: fontSize14,
                      color: Colors.black,
                      fontFamily: "Poppins",
                      decoration: TextDecoration.underline),
                ))
          ],
        ));
  }
}
