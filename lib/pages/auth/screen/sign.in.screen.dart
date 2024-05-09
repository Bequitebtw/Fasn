import 'package:fasn/main.dart';
import 'package:fasn/design/colors.dart';
import 'package:fasn/design/dimensions.dart';
import 'package:fasn/pages/auth/widgets/signIn/sign.in.header.dart';
import 'package:fasn/pages/auth/widgets/signIn/sign.in.link.dart';
import 'package:fasn/pages/auth/widgets/signIn/sign.in.reset.dart';
import 'package:fasn/pages/auth/widgets/signUp/sign.up.link.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isDisabled = false;
  String? _emailError;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = true;

  Future<void> userLogin({
    required final String email,
    required final String password,
  }) async {
    final responce = await supabase.auth
        .signInWithPassword(email: email, password: password);
  }

  @override
  void initState() {
    bool _isDisabled = true;
    super.initState();
    _emailController.addListener(updateFieldButton);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _isAgree() {
    if (_isDisabled &&
        _emailController.text != "" &&
        _passwordController.text != "") {
      return true;
    }
    return false;
  }

  void _validateForm() {
    setState(() {
      _isDisabled = _formKey.currentState?.validate() ?? false;
    });
  }

  String? _validateEmail(String value) {
    if (value == "") {
      return null;
    }
    RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  Color _ChangeColor(String value) {
    if (value == "" && _validateEmail(value) == null) {
      return primary100;
    }
    return Colors.green;
  }

  void updateFieldButton() {
    setState(() {
      _emailError = _validateEmail(_emailController.text);
    });
  }

  Widget _getStatusEmail(String? status) {
    if (status == null && _emailController.text == "") {
      return Icon(Icons.email, color: primary100);
    }
    if (status == 'Please enter an email address' ||
        status == 'Please enter a valid email address') {
      return Icon(Icons.error_outline);
    }
    return Icon(Icons.email, color: Colors.green);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 25, top: 40, right: 25, bottom: 10),
        children: [
          const SignInHeader(),
          Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                          TextFormField(
                            onChanged: (_) {
                              _validateForm();
                            },
                            controller: _emailController,
                            validator: (value) => _validateEmail(value ?? ""),
                            cursorColor: Colors.black,
                            cursorHeight: 25,
                            cursorWidth: 0.8,
                            decoration: InputDecoration(
                                suffixIcon: _getStatusEmail(_validateEmail(
                                    _emailController.text.trim())),
                                errorStyle: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: fontSize14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red),
                                errorText:
                                    _validateEmail(_emailController.text),
                                contentPadding: EdgeInsets.only(
                                    top: 18, bottom: 18, left: 10, right: 20),
                                labelText: "Enter your email",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                labelStyle: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: fontSize16,
                                    fontWeight: FontWeight.w400,
                                    color: primary400),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.green, width: 1.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 1.5),
                                    borderRadius: BorderRadius.circular(10)),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          _ChangeColor(_emailController.text),
                                      width: 1.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          _ChangeColor(_emailController.text),
                                      width: 1.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          _ChangeColor(_emailController.text),
                                      width: 1.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 1.5),
                                    borderRadius: BorderRadius.circular(10))),
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0,
                                fontSize: fontSize16,
                                fontFamily: "Poppins",
                                color: (primary900)),
                          ),
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
                          TextFormField(
                            onChanged: (_) {
                              _validateForm();
                            },
                            controller: _passwordController,
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
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined)),
                                errorStyle: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: fontSize14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red),
                                contentPadding: EdgeInsets.only(
                                    top: 18, bottom: 18, left: 10, right: 20),
                                labelText: "Сreate a new password",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                labelStyle: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: fontSize16,
                                    fontWeight: FontWeight.w400,
                                    color: primary400),
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: primary900, width: 1.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 1.5),
                                    borderRadius: BorderRadius.circular(10)),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: _ChangeColor(
                                          _passwordController.text),
                                      width: 1.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: _ChangeColor(
                                          _passwordController.text),
                                      width: 1.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: _ChangeColor(
                                          _passwordController.text),
                                      width: 1.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 1.5),
                                    borderRadius: BorderRadius.circular(10))),
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0,
                                fontSize: fontSize16,
                                fontFamily: "Poppins",
                                color: (primary900)),
                          ),
                        ],
                      )),
                ],
              )),
          SignInReset(),
          SizedBox(
            height: 24,
          ),
          Container(
            height: 54,
            child: FilledButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        _isAgree() ? primary900 : primary200),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                onPressed: _isAgree()
                    ? () async {
                        await userLogin(
                            email: _emailController.text,
                            password: _passwordController.text);
                        Navigator.pushReplacementNamed(context, '/AppRoute');
                      }
                    : null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: fontSize16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                )),
          ),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Text("Or",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: fontSize14,
                      color: primary500))),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      side: BorderSide(width: 1, color: primary200),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 54,
                          padding: EdgeInsets.only(right: 10),
                        ),
                        Text(
                          "Sign Up With Google",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: fontSize16,
                              fontWeight: FontWeight.w500,
                              color: primary900),
                        ),
                      ],
                    )),
                SizedBox(height: 236),
                SignInLink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
