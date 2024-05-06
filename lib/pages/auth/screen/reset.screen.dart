import 'package:fasn/pages/auth/widgets/reset/reset.main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetScreen extends StatelessWidget {
  const ResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: ResetMainScreen(),
      ),
    );
  }
}
