import 'package:fasn/main.dart';
import 'package:fasn/design/colors.dart';
import 'package:fasn/design/dimensions.dart';
import 'package:fasn/pages/app/main.app.screen.dart';
import 'package:fasn/pages/app/test.scree.dart';
import 'package:fasn/pages/auth/widgets/signIn/sign.in.link.dart';
import 'package:fasn/pages/auth/widgets/signUp/sign.up.header.dart';
import 'package:fasn/pages/auth/widgets/signUp/sign.up.link.dart';
import 'package:fasn/pages/auth/widgets/signUp/sign.up.policy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isDisabled = false;
  String? _nameError;
  String? _passwordError;
  String? _emailError;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = true;

  Future<void> createUser({
    required final String email,
    required final String password,
  }) async {
    final responce =
        await supabase.auth.signUp(email: email, password: password);
  }

  @override
  void initState() {
    _setupAuthListener();
    bool _isDisabled = true;
    super.initState();
    _emailController.addListener(updateFieldButton);
    _nameController.addListener(updateFieldButton);
    _passwordController.addListener(updateFieldButton);
  }

  void _setupAuthListener() {
    supabase.auth.onAuthStateChange.listen((data) {
      final event = data.event;
      if (event == AuthChangeEvent.signedIn) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const ProfileScreen(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  bool _isAgree() {
    if (_isDisabled &&
        _emailController.text != "" &&
        _nameController.text != "" &&
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

  String? _validateName(String value) {
    if (value == "") {
      return null;
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
    if (value == "") {
      return null;
    }
    RegExp nameRegex =
        RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,}$');
    if (!nameRegex.hasMatch(value)) {
      return 'The password must be at least 8 characters long, use\ncapital letters,numbers,and special characters.';
    }
    return null;
  }

  Color _ChangeColor(String value) {
    if (value == "" && _validatePassword(value) == null) {
      return primary100;
    }
    return Colors.green;
  }

  void updateFieldButton() {
    setState(() {
      _emailError = _validateEmail(_emailController.text);
      _nameError = _validateName(_nameController.text);
      _passwordError = _validatePassword(_passwordController.text);
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

  Widget _getStatusName(String? status) {
    if (status == null && _nameController.text == "") {
      return Icon(
        Icons.abc,
        color: primary100,
      );
    }
    if (status == 'Please enter a full name' ||
        status == 'Name need to be 4 symbols') {
      return Icon(Icons.error_outline);
    }
    return Icon(Icons.abc, color: Colors.green);
  }

  Future<AuthResponse> _googleSignIn() async {
    const webClientId =
        '766474982180-u7jr8c78u2j5qqeat3roh76dtid9l5r6.apps.googleusercontent.com';
    // const iosClientId = 'my-ios.apps.googleusercontent.com';

    final GoogleSignIn googleSignIn = GoogleSignIn(
      // clientId: iosClientId,
      serverClientId: webClientId,
    );
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }

    return supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 25, top: 40, right: 25, bottom: 10),
        color: Colors.white,
        child: Column(
          children: [
            const SignUpHeader(),
            Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.only(top: 5),
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
                            TextFormField(
                              controller: _nameController,
                              validator: (value) => _validateName(value ?? ""),
                              cursorColor: Colors.black,
                              cursorHeight: 25,
                              cursorWidth: 0.8,
                              decoration: InputDecoration(
                                  suffixIcon: _getStatusName(_validateName(
                                      _nameController.text.trim())),
                                  errorStyle: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: fontSize14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.red),
                                  errorText:
                                      _validateName(_nameController.text),
                                  contentPadding: EdgeInsets.only(
                                      top: 18, bottom: 18, left: 10, right: 20),
                                  labelText: "Enter your full name",
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
                                            _ChangeColor(_nameController.text),
                                        width: 1.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            _ChangeColor(_nameController.text),
                                        width: 1.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            _ChangeColor(_nameController.text),
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
                              onChanged: (_) {
                                _validateForm();
                              },
                            ),
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
                              validator: (value) =>
                                  _validatePassword(value ?? ""),
                              cursorColor: Colors.black,
                              cursorHeight: 25,
                              cursorWidth: 0.8,
                              obscureText: _passwordVisible,
                              decoration: InputDecoration(
                                  suffixIconColor: _passwordVisible
                                      ? primary400
                                      : primary900,
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
                                  errorText: _validatePassword(
                                      _passwordController.text.trim()),
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
                                    borderSide: BorderSide(
                                        color: primary900, width: 1.5),
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
            SignUpPolicy(),
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
                          createUser(
                              email: _emailController.text,
                              password: _passwordController.text);
                          Navigator.pushReplacementNamed(
                              context, '/SignInRoute');
                        }
                      : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Create an Account",
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
                      onPressed: _googleSignIn,
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
                  SignUpLink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
