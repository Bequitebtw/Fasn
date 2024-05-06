import 'package:fasn/design/colors.dart';
import 'package:fasn/design/dimensions.dart';
import 'package:flutter/material.dart';

class SignUpPolicy extends StatelessWidget {
  const SignUpPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flexible(
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
                // only for browsers
                // recognizer: TapGestureRecognizer()
                //   ..onTap = () async {
                //     var url = "https://www.youtube.com/";
                //     if (await canLaunch(url)) {
                //       await launch(url);
                //     } else {
                //       throw "Can`t load url";
                //     }
                //   },
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w500)),
            TextSpan(
              text: " and ",
            ),
            TextSpan(
                text: "Cookie Use",
                // only for browsers
                // recognizer: TapGestureRecognizer()
                //   ..onTap = () async {
                //     var url = "https://www.twitch.tv/";
                //     if (await canLaunch(url)) {
                //       await launch(url);
                //     } else {
                //       throw "Can`t load url";
                //     }
                //   },
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w500))
          ]))),
    );
  }
}
