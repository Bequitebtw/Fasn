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
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: ListView(
          children: [
            Row(
              children: [
                profileImageUrl == Null
                    ? Container(
                        child: Icon(
                          Icons.account_circle,
                          size: 60,
                          color: Colors.grey,
                        ),
                      )
                    : ClipOval(
                        child: Image.network(
                          profileImageUrl,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                SizedBox(
                  width: 20,
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
                Navigator.pushReplacementNamed(context, '/SignInRoute');
              },
              child: const Text('Sign out'),
            )
          ],
        ),
      ),
    );
  }
}
