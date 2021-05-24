import 'package:solar_app/Authentification/widget/widget.dart';
import 'package:flutter/material.dart';


class Signin extends StatefulWidget {

 final Function toggle;
 Signin(this.toggle);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: appBarMain( context),
       body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children:[
              Spacer(),
              Form(
                child:Column(children: [
                  TextFormField(
                          style: simpleTextStyle(),
                          decoration: textFieldInputDecoration("email"),
                        ),
                  
                      TextFormField(
                              obscureText: true,
                              validator: (val) {
                                return val.length > 6
                                    ? null
                                    : "Enter Password 6+ characters";
                              },
                              style: simpleTextStyle(),
                              decoration: textFieldInputDecoration("password"),
                            ),
                     
                ],)
              ),
              SizedBox( height: 16 ),
              GestureDetector(
                  onTap: () {
                      //TODO 
                    },
                   child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Text(
                                "Forgot Password?",
                                style: simpleTextStyle(),
                              )),
                      ],
                    ),
              ),
                SizedBox( height: 16 ),
             GestureDetector(
               onTap: () {
                      //Todo
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xff007EF4),
                              const Color(0xff2A75BC)
                            ],
                          )),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Sign In",
                        style: biggerTextStyle(),
                        textAlign: TextAlign.center,
                      ),
                    ),
             ),

             SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have account? ",
                        style:simpleTextStyle()
                      ),
                      GestureDetector(
                          onTap:(){
                           widget.toggle();
                          },
                          child: Container(
                          padding:EdgeInsets.symmetric(vertical:17),
                          child: Text(
                              "Register now",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  decoration: TextDecoration.underline),
                            ),
                        ),
                      ),
                        SizedBox(
                    height: 50,
                  )
                      ],
                  ),

            ]
          ),
       ),
    );
  }
}