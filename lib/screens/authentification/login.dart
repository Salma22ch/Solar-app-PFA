import 'package:flutter/material.dart';
import '../screens.dart';
import 'authentification.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return _Login();
  }
}

class _Login extends State<Login> {
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
              child: TextFormField(
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
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30.0,
                right: 30,
              ),
              child: TextFormField(
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
                  labelStyle: TextStyle(color: accentColor),
                ),
              ),
            ),
            Spacer(flex: 2),
            ElevatedButton(
              onPressed: () => {moveToRegisterPage(context,BottomNavScreen())},
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

  void moveToRegisterPage(BuildContext context,Widget page) {
    Navigator.of(context)
        .push(new MyCustomRoute(builder: (context) => page));
  }
}

