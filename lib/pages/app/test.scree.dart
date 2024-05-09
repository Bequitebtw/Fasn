import 'package:fasn/design/colors.dart';
import 'package:fasn/design/images.dart';
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
    final user = supabase.auth.currentUser;
    final profileImageUrl = user?.userMetadata?['avatar_url'];
    final fullName = user?.userMetadata?['full_name'];
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
                      logo,
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
                  Icon(
                    Icons.notifications_outlined,
                    color: secondaryColor,
                  )
                ],
              ),
            )),
        body: <Widget>[
          /// Home page
          ListView(
            children: [],
          ),
          ListView(
            children: [],
          ),

          /// Notifications page
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Card(
                  child: ListTile(
                    leading: Icon(Icons.notifications_sharp),
                    title: Text('Notification 1'),
                    subtitle: Text('This is a notification'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.notifications_sharp),
                    title: Text('Notification 2'),
                    subtitle: Text('This is a notification'),
                  ),
                ),
              ],
            ),
          ),

          /// Messages page
          ListView.builder(
            reverse: true,
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      'Hello',
                    ),
                  ),
                );
              }
              return Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Hi!',
                  ),
                ),
              );
            },
          ),
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
              label: 'home',
            ),
            NavigationDestination(
              icon: Badge(
                label: Text('2'),
                child: Icon(Icons.messenger_sharp, color: secondaryColor),
              ),
              label: 'cart',
            ),
            NavigationDestination(
              icon: Badge(
                child: Icon(Icons.abc, color: secondaryColor),
              ),
              label: "asd",
            ),
            NavigationDestination(
              icon: Icon(
                Icons.account_box,
                color: secondaryColor,
              ),
              label: "account",
            ),
          ],
        ));
  }
}
