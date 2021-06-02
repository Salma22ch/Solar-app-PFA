import 'package:flutter/material.dart';
import 'package:solar_app/screens/bottom_nav_screen.dart';
import 'authentification.dart';
import 'dart:convert';
import "package:flutter/material.dart";

import '../../NetworkHandler.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return _Register();
  }
}

class _Register extends State<Register> {
  NetworkHandler networkHandler = NetworkHandler();
  final _globalkey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordconfirmController = TextEditingController();
  String errorText;
  bool validate = false;
  bool circular = false;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    var primaryColor = Theme.of(context).primaryColor;
    var accentColor = Theme.of(context).accentColor;
    return (Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Image.asset("shape.png"),
                    Image.asset("ampoule.png"),
                  ],
                ),
              ],
            ),
            Spacer(flex: 1),
            Padding(
              padding: const EdgeInsets.only(
                left: 30.0,
                right: 30.0,
              ),
              child: Form(
                key: _globalkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value.isEmpty) return "Email can't be empty";
                        if (!value.contains("@")) return "Email is Invalid";
                        return null;
                      },
                      cursorColor: primaryColor,
                      decoration: inputDecoration(
                          primaryColor, accentColor, 'Enter your Email'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30.0,
                right: 30,
              ),
              child: TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value.isEmpty) return "Password can't be empty";
                    if (value.length < 8) return "Password lenght must have >=8";
                    return null;
                  },
                  cursorColor: primaryColor,
                  decoration: inputDecoration(
                      primaryColor, accentColor, 'Enter your Password')),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30.0,
                right: 30,
              ),
              child: TextFormField(
                  controller: _passwordconfirmController,
                  cursorColor: primaryColor,
                  decoration: inputDecoration(
                      primaryColor, accentColor, 'Confirm your Password')),
            ),
            Spacer(flex: 2),
            ElevatedButton(
              onPressed: () async  {
               /*var response = await networkHandler.get('');
               if (response.statusCode == 200 ){
                 Navigator.of(context)
                     .push(new MyCustomRoute(builder: (context) => BottomNavScreen()));
               }*/
              Map<String, String> data = {
              "email": _emailController.text,
              "password": _passwordController.text,
              };
             var responseRegister =await networkHandler.post("/api/register", data);
              },
              child: Text(
                "Register",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: accentColor,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width - 50, 50),
                  side: BorderSide(width: 2.0, color: primaryColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  primary: primaryColor),
            ),
            SizedBox(height: 10),
            OutlinedButton(
              onPressed: () => {moveToLoginPage(context)},
              child: Text(
                "Already have an Account",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: primaryColor,
                ),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width - 50, 50),
                side: BorderSide(width: 2.0, color: primaryColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    ));
  }

  InputDecoration inputDecoration(
      Color primaryColor, Color accentColor, String text) {
    return InputDecoration(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
      ),
      labelText: text,
      labelStyle: TextStyle(color: accentColor),
    );
  }

  void moveToLoginPage(BuildContext context) {
    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Register()));
    Navigator.of(context)
        .push(new MyCustomRoute(builder: (context) => Login()));
  }
}


