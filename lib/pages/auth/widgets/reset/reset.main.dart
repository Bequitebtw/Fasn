import 'package:fasn/design/colors.dart';
import 'package:fasn/design/dimensions.dart';
import 'package:fasn/pages/auth/widgets/reset/reset.header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ResetMainScreen extends StatefulWidget {
  const ResetMainScreen({super.key});

  @override
  State<ResetMainScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<ResetMainScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isDisabled = false;
  String? _emailError;
  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    bool _isDisabled = true;
    super.initState();
    _emailController.addListener(updateFieldButton);
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  bool _isAgree() {
    if (_isDisabled && _emailController.text != "") {
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
      body: Container(
        padding: EdgeInsets.only(left: 25, right: 25, bottom: 10),
        color: Colors.white,
        child: Column(
          children: [
            const ResetHeader(),
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
                  ],
                )),
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
                  onPressed: _isAgree() ? () async {} : null,
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
          ],
        ),
      ),
    );
  }
}
