import 'package:fasn/design/dimensions.dart';
import 'package:flutter/material.dart';

class MainAppScreen extends StatelessWidget {
  const MainAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "ACCOUNT",
          style: TextStyle(fontSize: fontSize64),
        ),
      ),
    );
  }
}
