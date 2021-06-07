import 'dart:convert';

import 'package:flutter/material.dart';
import '../../NetworkHandler.dart';
import '../screens.dart';
import 'authentification.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return _Login();
  }
}

class _Login extends State<Login> {
  bool vis = true;
  final _globalkey = GlobalKey<FormState>();
  NetworkHandler networkHandler = NetworkHandler();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String errorText;
  bool validate = false;
  bool circular = false;
  // Create storage
  final storage = new FlutterSecureStorage();
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
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primaryColor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primaryColor),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: primaryColor),
                          ),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: accentColor)),
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
                  return null;
                },
                obscureText: vis,
                cursorColor: primaryColor,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  labelText: 'Password',
                  errorText: validate ? null : errorText,
                  labelStyle: TextStyle(color: accentColor),
                  suffixIcon: IconButton(
                    icon: Icon(vis ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        vis = !vis;
                      });
                    },
                  ),
                ),
              ),
            ),
            Spacer(flex: 2),
            circular
                ? CircularProgressIndicator():
            ElevatedButton(
              onPressed: () async{
                checkInputs();
                if (_globalkey.currentState.validate() && validate) {
                Map<String, String> data = {
                  "email": _emailController.text,
                  "password": _passwordController.text,
                };
                var responseLogin =await networkHandler.post("/api/login", data);
                print(responseLogin.statusCode);
                if (responseLogin.statusCode == 200 ) {
                  Map<String, dynamic> output = json.decode(responseLogin.body);
                  Map<String, dynamic> payload = Jwt.parseJwt(output["token"]);
                  print(payload["email"]);
                  await storage.write(key: "token", value: output["token"]);
                  setState(() {
                    validate = true;
                   // circular = false;
                  });
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => BottomNavScreen(),),
                          (route) => false);
                }
                }},
              child: Text(
                "Login",
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
              onPressed: () => {moveToRegisterPage(context,Register())},
              child: Text(
                "Register",
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
              flex: 1,
            ),
            TextButton(
              onPressed: () => {},
              child: Text("Forget Password"),
            ),
            Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    ));
  }
  checkInputs()  {
    if (_emailController.text.length == 0 || _passwordController.text.length ==0) {
      setState(() {
        circular = false;
        validate = false;
        errorText= "Invalid inputs";
      });

    } else {
      setState(() {
        circular = true;
        validate = true;
      });
    }
  }
  void moveToRegisterPage(BuildContext context,Widget page) {
    Navigator.of(context)
        .push(new MyCustomRoute(builder: (context) => page));
  }
}

