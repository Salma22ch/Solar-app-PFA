import 'package:flutter/material.dart';
import 'package:solar_app/FirstPages/register.dart';

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
                    labelText: 'Enter your Email',
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
                  labelText: 'Enter your Password',
                  labelStyle: TextStyle(color: accentColor),
                ),
              ),
            ),
            Spacer(flex: 2),
            ElevatedButton(
              onPressed: () => {},
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
              onPressed: () => {moveToRegisterPage(context)},
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

  void moveToRegisterPage(BuildContext context) {
    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Register()));
    Navigator.of(context)
        .push(new MyCustomRoute(builder: (context) => Register()));
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    //if (settings.isInitialRoute) return child;
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return new FadeTransition(opacity: animation, child: child);
  }
}
