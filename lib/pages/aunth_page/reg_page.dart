import 'dart:math';

import 'package:fasn/design/colors.dart';
import 'package:fasn/design/dimensions.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 25, top: 40, right: 25),
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Create an account",
                      style: TextStyle(
                          letterSpacing: -1,
                          fontWeight: FontWeight.w600,
                          fontSize: fontSize32,
                          fontFamily: "Poppins",
                          color: blackColor)),
                  Text("Let’s create your account.",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0,
                          fontSize: fontSize16,
                          fontFamily: "Poppins",
                          color: (primary500)))
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(bottom: 16),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(bottom: 24)),
                    Text("Full Name",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0,
                            fontSize: fontSize16,
                            fontFamily: "Poppins",
                            color: (primary900))),
                    TextField(),
                  ],
                )),
            Container(
                padding: EdgeInsets.only(bottom: 16),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(bottom: 24)),
                    Text("Email",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0,
                            fontSize: fontSize16,
                            fontFamily: "Poppins",
                            color: (primary900))),
                    TextField(),
                  ],
                )),
            Container(
                padding: EdgeInsets.only(bottom: 16),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(bottom: 24)),
                    Text("Password",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0,
                            fontSize: fontSize16,
                            fontFamily: "Poppins",
                            color: (primary900))),
                    TextField(),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
