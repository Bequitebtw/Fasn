import 'package:fasn/design/colors.dart';
import 'package:fasn/design/dimensions.dart';
import 'package:fasn/pages/aunth_page/mainWidgets/reset_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LogReset extends StatelessWidget {
  const LogReset({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 22,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Forgot yout password",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: fontSize14,
                  color: primary500,
                  fontFamily: "Poppins"),
            ),
            TextButton(
                style: ButtonStyle(splashFactory: NoSplash.splashFactory),
                onPressed: () => {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const ResetPassword()))
                    },
                child: Text(
                  "Reset your password",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: fontSize14,
                      color: primary900,
                      fontFamily: "Poppins",
                      decoration: TextDecoration.underline),
                ))
          ],
        ));
  }
}
