import 'package:fasn/design/colors.dart';
import 'package:fasn/design/dimensions.dart';
import 'package:fasn/design/images.dart';
import 'package:fasn/pages/app/Favorite.screen.dart';
import 'package:fasn/pages/app/account.screen.dart';
import 'package:fasn/pages/app/cart.screen.dart';
import 'package:fasn/pages/app/home.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../main.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainAppScreen> {
  int _selectedIndex = 0;
  static const List _ = [
    HomeScreen(),
    FavoriteScreen(),
    CartScreen(),
    AccountScreen(),
  ];

  List<Text> _titles = [
    Text(
      "Goods",
      style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          color: secondaryColor,
          fontFamily: "Poppins"),
    ),
    Text(
      "Cart",
      style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          color: secondaryColor,
          fontFamily: "Poppins"),
    ),
    Text(
      "Favorite",
      style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          color: secondaryColor,
          fontFamily: "Poppins"),
    ),
    Text(
      "My profile",
      style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          color: secondaryColor,
          fontFamily: "Poppins"),
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "F",
                        style: TextStyle(
                            fontSize: fontSize24,
                            fontWeight: FontWeight.w400,
                            color: secondaryColor,
                            fontFamily: "Poppins"),
                      ),
                      Container(
                          child: Image.asset("assets/images/logo.png"),
                          height: 25),
                      Text(
                        "sn",
                        style: TextStyle(
                            fontSize: fontSize24,
                            fontWeight: FontWeight.w400,
                            color: secondaryColor,
                            fontFamily: "Poppins"),
                      ),
                    ],
                  ),
                  _titles.elementAt(_selectedIndex),
                  IconButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/NotificationRoute')},
                      icon: Icon(Icons.notifications_outlined,
                          color: secondaryColor))
                ],
              ),
            )),
        body: Center(
          child: _.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: primaryColor,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 25,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("images/wishlistIcon.png"),
                  size: 28,
                ),
                label: 'Wishlist',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("images/cartIcon.png"),
                  size: 28,
                ),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("images/accountIcon.png"),
                  size: 20,
                ),
                label: 'Account',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: secondaryColor,
            unselectedItemColor: Color.fromARGB(171, 0, 14, 145),
            onTap: _onItemTapped,
          ),
        ));
  }
}
