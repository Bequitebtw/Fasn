import 'package:fasn/design/colors.dart';
import 'package:fasn/main.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            "Settings",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: "Poppins"),
          ),
        ),
        body: Container(
          child: FilledButton(
              onPressed: () async {
                await supabase.auth.signOut();
                Navigator.pushReplacementNamed(context, '/SignInRoute');
              },
              child: Text("Sign Out")),
        ));
  }
}
