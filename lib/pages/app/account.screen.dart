import 'package:fasn/design/colors.dart';
import 'package:fasn/main.dart';
import 'package:fasn/pages/auth/screen/start.screen.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  get profileImageUrl => null;

  @override
  Widget build(BuildContext context) {
    final user = supabase.auth.currentUser;
    final profileImageUrl = user?.userMetadata?['avatar_url'];
    final fullName = user?.userMetadata?['full_name'];
    final email = user?.userMetadata?['email'];
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "My Profile",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: secondaryColor,
            fontFamily: 'Poppins',
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: ListView(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: ClipOval(
                    child: Image.network(
                      profileImageUrl,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Text(
                        fullName,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            color: Colors.white),
                      ),
                    ),
                    Text(
                      email,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                          color: borderColor),
                    )
                  ],
                )
              ],
            ),
            TextButton(
              onPressed: () async {
                await supabase.auth.signOut();
                if (context.mounted) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => const StartScreen()),
                  );
                }
              },
              child: const Text('Sign out'),
            )
          ],
        ),
      ),
    );
  }
}
