import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:solar_app/config/palette.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:solar_app/screens/predections_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';
import '../NetworkHandler.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key key}) : super(key: key);

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  File _file;
  final GlobalKey<ScaffoldState> _scaffoldstate =
      new GlobalKey<ScaffoldState>();

  Future getFile() async {
    File file = await FilePicker.getFile(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );

    setState(() {
      _file = file;
    });
  }

  NetworkHandler networkHandler = NetworkHandler();
  final storage = FlutterSecureStorage();
  var response;
  String userid = "";
  String email;
  TextEditingController _battery1Controller = TextEditingController();
  TextEditingController _panel1Controller = TextEditingController();
  TextEditingController _panel2Controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    getuserid();
  }

  getuserid() async {
    String token = await storage.read(key: "token");
    Map<String, dynamic> payload = Jwt.parseJwt(token);
    print(payload);

    setState(() {
      userid = payload["id"];
    });
    response = await networkHandler.get("/api/user/" + userid);
    print(jsonDecode(response.body));

    // setState(() {
    //   _battery1Controller.text=response.body!=null?jsonDecode(response.body)["battery"][0]:"Loading";
    //   _panel1Controller.text=response.body!=null?jsonDecode(response.body)["panels"][0]:"Loading";
    //   _panel2Controller.text=response.body!=null?jsonDecode(response.body)["panels"][1]:"Loading";
    // });
  }

  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      body:
          CustomScrollView(physics: ClampingScrollPhysics(), slivers: <Widget>[
        _buildUploadFile(),
        SliverPadding(
            padding: const EdgeInsets.only(top: 20),
            sliver: SliverToBoxAdapter(
                child: Container(
                    height: 1500,
                    decoration: BoxDecoration(
                      color: Palette.backgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(children: [
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
                              left: 40,
                              right: 70,
                              top: 20,
                              bottom: 40,
                            ),
                            child: Form(
                              key: _formKey1,
                              child: Column(children: [
                                TextFormField(
                                  controller: _battery1Controller,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field should not be empty!';
                                    }
                                    return null;
                                  },
                                  cursorColor: Palette.primaryColor,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.primaryColor),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.primaryColor),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.primaryColor),
                                      ),
                                      labelText: 'Capacity ( KWH )',
                                      labelStyle: TextStyle(
                                          color: Palette.accentColor)),
                                ),
                              ]),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              // ignore: deprecated_member_use
                              FlatButton(
                                onPressed: () async {
                                  if (_formKey1.currentState.validate()) {
                                    Map<String, String> data = {
                                      "cara1": _battery1Controller.text,
                                    };
                                    var responseLogin =
                                        await networkHandler.put(
                                            "/api/user/" + userid + "/battery",
                                            data);
                                    print(responseLogin.statusCode);
                                    if (responseLogin.statusCode == 200) {
                                      showToast();
                                    }
                                  }
                                },
                                child: Text(
                                  "Save",
                                  style: TextStyle(
                                    color: Palette.primaryColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      ExpansionTile(
                        title: Text('Solar Panels'),
                        leading: Image.asset("solar-panel.png"),
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 40,
                              top: 20,
                              right: 70,
                              bottom: 40,
                            ),
                            child: Form(
                              key: _formKey2,
                              child: Column(children: [
                                TextFormField(
                                  controller: _panel1Controller,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field should not be empty!';
                                    }
                                    return null;
                                  },
                                  cursorColor: Palette.primaryColor,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.primaryColor),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.primaryColor),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.primaryColor),
                                      ),
                                      labelText: 'Carac 1 en (KWH)',
                                      labelStyle: TextStyle(
                                          color: Palette.accentColor)),
                                ),
                                TextFormField(
                                  controller: _panel2Controller,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field should not be empty!';
                                    }
                                    return null;
                                  },
                                  cursorColor: Palette.primaryColor,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.primaryColor),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.primaryColor),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.primaryColor),
                                      ),
                                      labelText: 'Carac 2 en (KWH)',
                                      labelStyle: TextStyle(
                                          color: Palette.accentColor)),
                                ),
                              ]),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              // ignore: deprecated_member_use
                              FlatButton(
                                onPressed: () async {
                                  if (_formKey2.currentState.validate()) {
                                    Map<String, String> data = {
                                      "cara1": _panel1Controller.text,
                                      "cara2": _panel2Controller.text,
                                    };
                                    var responseLogin =
                                        await networkHandler.put(
                                            "/api/user/" + userid + "/panels",
                                            data);
                                    print(responseLogin.statusCode);
                                    if (responseLogin.statusCode == 200) {
                                      showToast();
                                    }
                                  }
                                },
                                child: Text(
                                  "Save",
                                  style: TextStyle(
                                    color: Palette.primaryColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.all(20),
                          child: ElevatedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Palette.primaryColor,
                              primary: Palette.accentColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              "Go",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Palette.accentColor,
                              ),
                            ),
                            onPressed: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PredectionScreen()),
                              )
                            },
                          ))
                    ]))))
      ]),
    );
  }

  SliverToBoxAdapter _buildUploadFile() {
    String indicator = "Consumption of the last week :";
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                indicator,
                style: TextStyle(
                    color: Palette.accentColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
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
              onPressed: () {
                getFile();
                setState(() {
                  indicator = basename(_file.path);
                });
                //  _uploadFile(_file);
              },
            )
          ],
        ),
      ),
    );
  }

  void _uploadFile(filePath) async {
    String fileName = basename(filePath.path);
    print("file base name:$fileName");

    var fileresponse =
        await networkHandler.patchfile("/add/" + userid + "/file", _file.path);
    if (fileresponse.statusCode == 200) {
      print("File upload response successfully");
      _showSnackBarMsg("File upload response successfully");
    } else {
      print("error occured");
    }
    /* try {
      FormData formData = new FormData.fromMap({
        "name": "salma",
        "file": await MultipartFile.fromFile(filePath.path, filename: fileName),
      });

     Response response = await Dio().post("",data: formData);
      print("File upload response: $response");
      _showSnackBarMsg(response.data['message']);
    } catch (e) {
      print("expectation Caugch: $e");
    }*/
  }

  void _showSnackBarMsg(String msg) {
    _scaffoldstate.currentState.showSnackBar(new SnackBar(
      content: new Text(msg),
    ));
  }

  void showToast() {
    Fluttertoast.showToast(
      msg: 'Data Saved',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
    );
  }
}
