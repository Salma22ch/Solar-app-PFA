import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'dart:convert';

class NetworkHandler {
  String baseurl = 'https://backendpfa.herokuapp.com';
  var log = Logger();

  Future<dynamic> get(String url) async {
   url=formater(url);
   var response =await http.get(url);
   log.i(response.body);
   log.i(response.statusCode);
  }

  Future<http.Response> post(String url , Map<String, String> body) async {
    url=formater(url);
    var response = await http.post(
      url,
      body: json.encode(body),
    );
    log.i(response.body);
    log.i(response.statusCode);
    return response;
  }


  String formater(String url) {
    return baseurl+url;
  }


}