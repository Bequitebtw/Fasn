import 'dart:math';

import 'package:fasn/design/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

List products = [
  'Товар',
  "Товар",
  "Товар",
  "Товар",
  'Товар',
  "Товар",
  "Товар",
  "Товар",
  'Brileo',
  "Brileo",
  "ЖоBrileoпа",
  "Brileo"
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFavorite = false;
  void ChangeColor() {
    isFavorite = true;
  }

  @override
  void initState() {
    isFavorite = true;
  }

  Widget build(BuildContext context) {
    final image = AssetImage('images/Paclan.jpg');
    return Container(
        child: GridView.count(
      crossAxisCount: 2,
      children: List.generate(10, (index) {
        return Container(
          padding: EdgeInsets.only(left: 15, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 220,
                height: 205,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () => {ChangeColor()},
                            icon: isFavorite
                                ? Icon(
                                    Icons.favorite_outline_rounded,
                                    color: Colors.black,
                                    size: 27,
                                  )
                                : Icon(
                                    Icons.favorite_sharp,
                                    color: Colors.red,
                                    size: 27,
                                  )),
                        SizedBox(
                          width: 50,
                        )
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: image,
                    ),
                    borderRadius: BorderRadius.all(Radius.elliptical(20, 20))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Товар ${index}',
                        style: TextStyle(
                          color: secondaryColor,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        r" $10",
                        style: TextStyle(
                          color: secondaryColor,
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        );
      }),
    ));
  }
}
