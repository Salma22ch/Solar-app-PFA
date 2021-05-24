import 'package:solar_app/Authentification/views/signin.dart';
import 'package:solar_app/Authentification/views/signup.dart';
import 'package:flutter/material.dart';

class Authentificate extends StatefulWidget {
  @override
  _AuthentificateState createState() => _AuthentificateState();
}

class _AuthentificateState extends State<Authentificate> {

  bool showSignIn=true;
 
  void toggleView(){
    setState(() {
       showSignIn = !showSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
     if(showSignIn){
      return Signin(toggleView);
    }else{
      return Signup(toggleView);
    
  }
  }
}