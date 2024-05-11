import 'package:fasn/design/colors.dart';
import 'package:fasn/design/images.dart';
import 'package:fasn/pages/app/account.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
            backgroundColor: primaryColor,
            automaticallyImplyLeading: false,
            title: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "F",
                        style: TextStyle(
                            fontFamily: "Popins",
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: secondaryColor),
                      ),
                      Text(
                        "sn",
                        style: TextStyle(
                            fontFamily: "Popins",
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: secondaryColor),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/NotificationRoute')},
                      icon: Icon(Icons.notifications_outlined,
                          color: secondaryColor))
                ],
              ),
            )),
        body: <Widget>[
          /// Home page
          ListView(
            children: [],
          ),
          // Cart page
          ListView(
            children: [],
          ),
          // Likes page
          ListView(
            children: [],
          ),

          /// Account page
          AccountScreen(),
        ][currentPageIndex],
        bottomNavigationBar: NavigationBar(
          overlayColor: MaterialStatePropertyAll(primaryColor),
          backgroundColor: primaryColor,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.home_outlined, color: secondaryColor),
              label: 'HOME',
            ),
            NavigationDestination(
              icon: Badge(
                child: Icon(Icons.messenger_sharp, color: secondaryColor),
              ),
              label: 'LIKES',
            ),
            NavigationDestination(
              icon: Badge(
                child: Icon(Icons.messenger_sharp, color: secondaryColor),
              ),
              label: 'CART',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.account_box,
                color: secondaryColor,
              ),
              label: "ACCOUNT",
            ),
          ],
        ));
  }
}
