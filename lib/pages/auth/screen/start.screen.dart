import 'package:fasn/design/colors.dart';
import 'package:fasn/design/dimensions.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        padding: EdgeInsets.only(top: 40, left: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    "Define\nyourself in\nyour unique\nway.",
                    style: TextStyle(
                        letterSpacing: -5,
                        fontSize: 64,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                        height: 0.85,
                        color: blackColor),
                  ),
                ),
              ],
            ),
            Expanded(
                child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  child: Image.asset(
                    "assets/images/start_screen_image.png",
                    scale: 0.95,
                  ),
                  bottom: -190,
                  right: -10,
                )
              ],
            )),
            Container(
              padding: EdgeInsets.only(top: 25, bottom: 25, right: 25),
              color: Colors.white,
              height: 107,
              child: FilledButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(blackColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  onPressed: () =>
                      {Navigator.pushNamed(context, "/SignUpRoute")},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Get Started",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: fontSize16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 20,
                        color: Colors.white,
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
