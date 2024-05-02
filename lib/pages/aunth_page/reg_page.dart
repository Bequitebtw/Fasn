import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fasn/design/colors.dart';
import 'package:fasn/design/dimensions.dart';
import 'package:fasn/design/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _nameError;
  String? _passwordError;
  String? _emailError;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = true;
  @override
  void initState() {
    _passwordVisible = true;
    super.initState();
    _emailController.addListener(updateFieldButton);
    _nameController.addListener(updateFieldButton);
  }

  String? _validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter an email address';
    }
    RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validateName(String value) {
    if (value.isEmpty) {
      return 'Please enter a full name';
    }
    RegExp nameRegex = RegExp(r'^[a-zA-Z]+$');
    if (!nameRegex.hasMatch(value)) {
      return 'Use only Latin letters';
    }
    if (value.length < 4) {
      return 'Name need to be 4 symbols';
    }

    return null;
  }

  String? _validatePassword(String value) {
    RegExp nameRegex =
        RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,}$');
    if (!nameRegex.hasMatch(value)) {
      return 'Use capital letters,numbers,and\nspecial characters';
    }
    if (value.length < 8) {
      return 'The password must be at least 8 characters long';
    }
    return null;
  }

  Color _ChangeColor(String value) {
    if (value == "Please enter a valid email address") {
      return Colors.green;
    }
    if (value == "") {
      return Colors.green;
    }
    return primary900;
  }

  void updateFieldButton() {
    setState(() {
      _emailError = _validateEmail(_emailController.text);
      _nameError = _validateName(_nameController.text);
      _passwordError = _validatePassword(_passwordController.text);
    });
  }

  Widget _getStatus(String? status) {
    if (status == 'Please enter a full name' ||
        status == 'Name need to be 4 symbols' ||
        status == 'Please enter an email address' ||
        status == 'Please enter a valid email address' ||
        status == 'The password must be at least 8 characters long' ||
        status == 'Use only Latin letters' ||
        status == 'Use capital letters,numbers,and\nspecial characters') {
      return Icon(Icons.error_outline);
    }
    return Icon(Icons.done_outline_rounded, color: Colors.green);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 25, top: 40, right: 25),
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 24),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Create an account",
                      style: TextStyle(
                          letterSpacing: -1,
                          fontWeight: FontWeight.w600,
                          fontSize: fontSize32,
                          fontFamily: "Poppins",
                          color: blackColor)),
                  Text("Let’s create your account.",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0,
                          fontSize: fontSize16,
                          fontFamily: "Poppins",
                          color: (primary500)))
                ],
              ),
            ),
            Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 7,
                        bottom: 4,
                      ),
                      child: Text("Full Name",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0,
                              fontSize: fontSize16,
                              fontFamily: "Poppins",
                              color: (primary900))),
                    ),
                    Form(
                      child: TextFormField(
                        controller: _nameController,
                        validator: (value) => _validateName(value ?? ""),
                        cursorColor: Colors.black,
                        cursorHeight: 25,
                        cursorWidth: 0.8,
                        decoration: InputDecoration(
                            suffixIcon:
                                _getStatus(_validateName(_nameController.text)),
                            errorStyle: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: fontSize14,
                                fontWeight: FontWeight.w500,
                                color: Colors.red),
                            errorText: _validateName(_nameController.text),
                            contentPadding: EdgeInsets.only(
                                top: 18, bottom: 18, left: 10, right: 20),
                            labelText: "Enter your full name",
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelStyle: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: fontSize16,
                                fontWeight: FontWeight.w400,
                                color: primary400),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.5),
                                borderRadius: BorderRadius.circular(10)),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.5),
                                borderRadius: BorderRadius.circular(10))),
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0,
                            fontSize: fontSize16,
                            fontFamily: "Poppins",
                            color: (primary900)),
                        onChanged: (text) {
                          print(text);
                        },
                      ),
                    )
                  ],
                )),
            Container(
                padding: EdgeInsets.only(top: 10),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 7,
                        bottom: 4,
                      ),
                      child: Text("Email",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0,
                              fontSize: fontSize16,
                              fontFamily: "Poppins",
                              color: (primary900))),
                    ),
                    Form(
                      child: TextFormField(
                        controller: _emailController,
                        validator: (value) => _validateEmail(value ?? ""),
                        cursorColor: Colors.black,
                        cursorHeight: 25,
                        cursorWidth: 0.8,
                        decoration: InputDecoration(
                            suffixIcon: _getStatus(
                                _validateEmail(_emailController.text)),
                            errorStyle: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: fontSize14,
                                fontWeight: FontWeight.w500,
                                color: Colors.red),
                            errorText: _validateEmail(_emailController.text),
                            contentPadding: EdgeInsets.only(
                                top: 18, bottom: 18, left: 10, right: 20),
                            labelText: "Enter your email",
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelStyle: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: fontSize16,
                                fontWeight: FontWeight.w400,
                                color: primary400),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.5),
                                borderRadius: BorderRadius.circular(10)),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.5),
                                borderRadius: BorderRadius.circular(10))),
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0,
                            fontSize: fontSize16,
                            fontFamily: "Poppins",
                            color: (primary900)),
                        onChanged: (text) {
                          print(text);
                        },
                      ),
                    )
                  ],
                )),
            Container(
                padding: EdgeInsets.only(top: 10, bottom: 20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 7,
                        bottom: 4,
                      ),
                      child: Text("Password",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0,
                              fontSize: fontSize16,
                              fontFamily: "Poppins",
                              color: (primary900))),
                    ),
                    Form(
                      child: TextFormField(
                        controller: _passwordController,
                        validator: (value) => _validatePassword(value ?? ""),
                        cursorColor: Colors.black,
                        cursorHeight: 25,
                        cursorWidth: 0.8,
                        obscureText: _passwordVisible,
                        decoration: InputDecoration(
                            suffixIconColor:
                                _passwordVisible ? primary400 : primary900,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (_passwordVisible == false) {
                                      _passwordVisible = true;
                                    } else {
                                      _passwordVisible = false;
                                    }
                                  });
                                },
                                icon: Icon(_passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility)),
                            errorStyle: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: fontSize14,
                                fontWeight: FontWeight.w500,
                                color: Colors.red),
                            errorText:
                                _validatePassword(_passwordController.text),
                            contentPadding: EdgeInsets.only(
                                top: 18, bottom: 18, left: 10, right: 20),
                            labelText: "Сreate a new password",
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelStyle: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: fontSize16,
                                fontWeight: FontWeight.w400,
                                color: primary400),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.5),
                                borderRadius: BorderRadius.circular(10)),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.5),
                                borderRadius: BorderRadius.circular(10))),
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0,
                            fontSize: fontSize16,
                            fontFamily: "Poppins",
                            color: (primary900)),
                        onChanged: (text) {
                          print(text);
                        },
                      ),
                    )
                  ],
                )),
            Flexible(
                child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: fontSize14,
                            color: primary900,
                            fontFamily: "Poppins"),
                        children: [
                  TextSpan(text: "By signing up you agree to our "),
                  TextSpan(
                      text: "Terms, Privacy Policy",
                      // only for browsers
                      // recognizer: TapGestureRecognizer()
                      //   ..onTap = () async {
                      //     var url = "https://www.youtube.com/";
                      //     if (await canLaunch(url)) {
                      //       await launch(url);
                      //     } else {
                      //       throw "Can`t load url";
                      //     }
                      //   },
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500)),
                  TextSpan(
                    text: " and ",
                  ),
                  TextSpan(
                      text: "Cookie Use",
                      // only for browsers
                      // recognizer: TapGestureRecognizer()
                      //   ..onTap = () async {
                      //     var url = "https://www.twitch.tv/";
                      //     if (await canLaunch(url)) {
                      //       await launch(url);
                      //     } else {
                      //       throw "Can`t load url";
                      //     }
                      //   },
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500))
                ]))),
          ],
        ),
      ),
    );
  }
}
