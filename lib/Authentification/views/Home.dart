import 'package:solar_app/Authentification/helper/authentificate.dart';
import 'package:solar_app/Authentification/services/auth.dart';
import 'package:solar_app/Authentification/views/Home.dart';
import 'package:solar_app/Authentification/views/signin.dart';
import 'package:solar_app/Authentification/widget/widget.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  AuthService authserv=new AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Welcome"),
        actions: [
          GestureDetector(
            onTap:(){
              authserv.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder:(context) => Authentificate()));

            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child:Icon(Icons.exit_to_app) ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child:Icon(Icons.search) ,
        onPressed: (){
          print("hi");
        },
      ),



    );
  }
}