import 'package:fasn/design/colors.dart';
import 'package:fasn/design/dimensions.dart';
import 'package:fasn/main.dart';
import 'package:fasn/pages/auth/screen/start.screen.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  get profileImageUrl => null;
  final items = ['Item1,Item2,item3,item4'];
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
        padding: const EdgeInsets.only(left: 15, right: 15),
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
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 200.0,
              height: 58,
              child: FilledButton(
                onPressed: () => {},
                child: Row(
                  children: [
                    ImageIcon(AssetImage("images/ordersIcon.png")),
                    SizedBox(
                      height: 5,
                      width: 10,
                    ),
                    Text(
                      'My Orders',
                      style: TextStyle(
                          fontSize: fontSize14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.transparent),
                  backgroundColor: violateColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 200.0,
              height: 58,
              child: FilledButton(
                onPressed: () => {},
                child: Row(
                  children: [
                    ImageIcon(AssetImage("images/wishlistIcon.png")),
                    SizedBox(
                      height: 5,
                      width: 10,
                    ),
                    Text(
                      'My Wishlist',
                      style: TextStyle(
                          fontSize: fontSize14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.transparent),
                  backgroundColor: violateColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 200.0,
              height: 58,
              child: FilledButton(
                onPressed: () => {},
                child: Row(
                  children: [
                    ImageIcon(AssetImage("images/adressIcon.png")),
                    SizedBox(
                      height: 5,
                      width: 10,
                    ),
                    Text(
                      'Shipping Address',
                      style: TextStyle(
                          fontSize: fontSize14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.transparent),
                  backgroundColor: violateColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 200.0,
              height: 58,
              child: FilledButton(
                onPressed: () => {},
                child: Row(
                  children: [
                    ImageIcon(AssetImage("images/paymentIcon.png")),
                    SizedBox(
                      height: 5,
                      width: 10,
                    ),
                    Text(
                      'Payment Method',
                      style: TextStyle(
                          fontSize: fontSize14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.transparent),
                  backgroundColor: violateColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 200.0,
              height: 58,
              child: FilledButton(
                onPressed: () => {},
                child: Row(
                  children: [
                    ImageIcon(AssetImage("images/reviewsIcon.png")),
                    SizedBox(
                      height: 5,
                      width: 10,
                    ),
                    Text(
                      'Reviews',
                      style: TextStyle(
                          fontSize: fontSize14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.transparent),
                  backgroundColor: violateColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 200.0,
              height: 58,
              child: FilledButton(
                onPressed: () => {},
                child: Row(
                  children: [
                    ImageIcon(AssetImage("images/helpIcon.png")),
                    SizedBox(
                      height: 5,
                      width: 10,
                    ),
                    Text(
                      'Help',
                      style: TextStyle(
                          fontSize: fontSize14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.transparent),
                  backgroundColor: violateColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 200.0,
              height: 58,
              child: FilledButton(
                onPressed: () => {},
                child: Row(
                  children: [
                    ImageIcon(AssetImage("images/aboutIcon.png")),
                    SizedBox(
                      height: 5,
                      width: 10,
                    ),
                    Text(
                      'About',
                      style: TextStyle(
                          fontSize: fontSize14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.transparent),
                  backgroundColor: violateColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 200.0,
              height: 58,
              child: FilledButton(
                onPressed: () =>
                    {Navigator.pushNamed(context, '/SettingsScreen')},
                child: Row(
                  children: [
                    ImageIcon(AssetImage("images/settingsIcon.png")),
                    SizedBox(
                      height: 5,
                      width: 10,
                    ),
                    Text(
                      'Settings',
                      style: TextStyle(
                          fontSize: fontSize14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.transparent),
                  backgroundColor: violateColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
