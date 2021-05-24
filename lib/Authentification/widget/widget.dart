import 'package:flutter/material.dart';


Widget appBarMain(BuildContext context){
  return AppBar(
    title:Text("Optimise solar enrgy  "),
  );
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color:  Color(0xff1F1F1F))),
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color:  Color(0xff1F1F1F)))
     );
}

TextStyle simpleTextStyle() {
  return TextStyle(color:  Color(0xff1F1F1F), fontSize: 16);
}

TextStyle biggerTextStyle() {
  return TextStyle(color:  Color(0xff1F1F1F), fontSize: 17);
}