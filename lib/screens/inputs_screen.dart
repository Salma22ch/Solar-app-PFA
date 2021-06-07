import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solar_app/config/palette.dart';
import 'package:fluttertoast/fluttertoast.dart';  


class InputScreen extends StatefulWidget {
  const InputScreen({Key key}) : super(key: key);

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {

  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildUploadFile(),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20),
            sliver: SliverToBoxAdapter(
            child: Container(
                  height: 1000,
                  decoration: BoxDecoration(
                    color: Palette.backgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'System Configuration',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      ExpansionTile(
                          title: Text('Battery'),
                          leading: Image.asset("battery.png"),
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left:40,
                                right: 70,
                                top:20,
                                bottom: 40,
                              ),
                              child: Form(
                                key: _formKey1,
                                child: Column(
                                children:[
                                  TextFormField(
                                  validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field should not be empty!';
                                      }
                                      return null;
                                    },
                                  cursorColor: Palette.primaryColor,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly],
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Palette.primaryColor),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Palette.primaryColor),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Palette.primaryColor),
                                      ),
                                      labelText: 'Capacity',
                                      labelStyle: TextStyle(color: Palette.accentColor)),
                            ),
                              TextFormField(
                                validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field should not be empty!';
                                      }
                                      return null;
                                    },
                              cursorColor: Palette.primaryColor,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly],
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Palette.primaryColor),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Palette.primaryColor),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Palette.primaryColor),
                                      ),
                                      labelText: 'Caract 2',
                                      labelStyle: TextStyle(color: Palette.accentColor)),
                            ),
                                ]), ),),
                            Row(mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                            // ignore: deprecated_member_use
                            FlatButton(onPressed: () {
                              if(_formKey1.currentState.validate()) { showToast();}
                                
                              }, child: Text("Save"),),],), ], ),
                      ExpansionTile(
                            title: Text('Solar Panels'),
                            leading: Image.asset("solar-panel.png"),
                            children: [
                              Padding(
                              padding: const EdgeInsets.only(
                                left:40,
                                top:20,
                                right: 70,
                                bottom: 40,
                              ),
                              child: Form(
                                key: _formKey2,
                                child: Column(
                                  children:[
                                TextFormField(
                                  validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field should not be empty!';
                                      }
                                      return null;
                                    },
                                cursorColor: Palette.primaryColor,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly],
                                    decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Palette.primaryColor),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Palette.primaryColor),
                                        ),
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Palette.primaryColor),
                                        ),
                                        labelText: 'Carac 1',
                                        labelStyle: TextStyle(color: Palette.accentColor)),
                              ),
                              TextFormField(
                                validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field should not be empty!';
                                      }
                                      return null;
                                    },
                              cursorColor: Palette.primaryColor,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly],
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Palette.primaryColor),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Palette.primaryColor),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Palette.primaryColor),
                                      ),
                                      labelText: 'Caract 2',
                                      labelStyle: TextStyle(color: Palette.accentColor)),
                            ),
                            
                                ]), ),),
                            Row(mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget> [
                            // ignore: deprecated_member_use
                            FlatButton(onPressed: () { 
                              if(_formKey2.currentState.validate()) { showToast();}
                            }, child: Text("Save"),),],), ],),
                            
                      ExpansionTile(
                            title: Text('Hyperparameters'),
                            leading: Image.asset("hyperparameters.png"),
                            children: [
                              Padding(
                              padding: const EdgeInsets.only(
                                left:40,
                                top:20,
                                right: 70,
                                bottom: 40,
                              ),
                              child: Form(
                                key: _formKey3,
                                child: Column(
                                  children:[
                                TextFormField(
                                  validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field should not be empty!';
                                      }
                                      return null;
                                    },
                                cursorColor: Palette.primaryColor,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly],
                                    decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Palette.primaryColor),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Palette.primaryColor),
                                        ),
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Palette.primaryColor),
                                        ),
                                        labelText: 'Hyperpara 1',
                                        labelStyle: TextStyle(color: Palette.accentColor)),
                              ),
                              TextFormField(
                                validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field should not be empty!';
                                      }
                                      return null;
                                    },
                              cursorColor: Palette.primaryColor,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly],
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Palette.primaryColor),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Palette.primaryColor),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Palette.primaryColor),
                                      ),
                                      labelText: 'Hyperpara 2',
                                      labelStyle: TextStyle(color: Palette.accentColor)),
                            ),
                                ],),),),
                                Row(mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                  // ignore: deprecated_member_use
                                  FlatButton(onPressed: () { 
                                    if(_formKey3.currentState.validate()) { showToast();}
                                  }, child: Text("Save", style: TextStyle(
                                    color: Palette.primaryColor,
                                ),),),]), ]),
                            
                  Padding(padding: const EdgeInsets.all(20), child: ElevatedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Palette.primaryColor,
                      primary: Palette.accentColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), 
                      ),
              ),
              child: Text("Go", style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Palette.accentColor,
                ),),
              onPressed: () => {},
                ) )
                              ]
      ))))]),
                          );
                        
                         
    
  }
  
}
SliverToBoxAdapter _buildUploadFile() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text("Consumption of the last week :",style: TextStyle(
                color: Palette.accentColor,
                fontSize: 18,
                fontWeight: FontWeight.w300
              ),),
            ),
            ElevatedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Palette.accentColor,
                primary: Palette.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), 
                ),
              ),
              child: Text("Upload"),
              onPressed: () => {},
            )
          ],
        ),
      ),
    );
  }

  void showToast() {  
    Fluttertoast.showToast(  
        msg: 'Data Saved',  
        toastLength: Toast.LENGTH_SHORT,  
        gravity: ToastGravity.BOTTOM,  
        timeInSecForIos: 1,
    );  
  }
