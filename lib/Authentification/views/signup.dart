import 'package:solar_app/Authentification/services/auth.dart';
import 'package:solar_app/Authentification/services/database.dart';
import 'package:solar_app/Authentification/views/Home.dart';
import 'package:solar_app/Authentification/widget/widget.dart';
import 'package:flutter/material.dart';


class Signup extends StatefulWidget {
  final Function toggle;
 Signup(this.toggle);
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  

AuthService authService = new AuthService();

DatabaseMethods databaseMethods=new DatabaseMethods();

final formKey = GlobalKey<FormState>();
bool isLoading = false;

TextEditingController emailEditingController = new TextEditingController();
TextEditingController passwordEditingController = new TextEditingController();
TextEditingController usernameEditingController = new TextEditingController();

signMeUP() {
 if(formKey.currentState.validate()){
             Map<String,String> userDataMap = {
                "name" : usernameEditingController.text,
                "email" : emailEditingController.text
              };     
               setState(() {
             isLoading = true;
                   });
              authService.signUpWithEmailAndPassword(emailEditingController.text,
                 passwordEditingController.text).then((result){
                       print("$result");
                 
               databaseMethods.uplodUserInfo(userDataMap);      
                 Navigator.pushReplacement(context, MaterialPageRoute(
                  builder:(context)=>Home()));
                  });
                   }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: appBarMain( context),
       body: isLoading ? Center(
         child: Container(
             child: CircularProgressIndicator() 
         ),
       ): Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children:[
                Spacer(),
                Form(
                   key: formKey,
                  child:Column(children: [
                     TextFormField(
                       validator: (val){
                        return val.isEmpty || val.length < 3 ? "Enter Username 3+characters" : null;
                             },
                             controller: usernameEditingController,
                            style: simpleTextStyle(),
                            decoration: textFieldInputDecoration("username"),
                          ),
                    TextFormField(
                             validator: (val){
                             return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ? null : "Enter correct email";
                                  },
                             controller: emailEditingController,
                            style: simpleTextStyle(),
                            decoration: textFieldInputDecoration("email"),
                          ),
                    
                    TextFormField(
                                obscureText: true,
                                validator: (val) {
                                  return val.length > 5
                                      ? null
                                      : "Enter Password 5+ characters";
                                },
                                 controller: passwordEditingController,
                                style: simpleTextStyle(),
                                decoration: textFieldInputDecoration("password"),
                              ),
                       
                  ],)
                ),
                
               
                  SizedBox( height: 16 ),
               GestureDetector(
                 onTap: () {
                       signMeUP();
                        
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
                          "Sign Up",
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
                         GestureDetector(
                          onTap:(){
                           widget.toggle();
                          },
                          child: Container(
                          padding:EdgeInsets.symmetric(vertical:17),
                          child: Text(
                              "Already have an account !",
                              style: TextStyle(
                                  color: Colors.white,
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