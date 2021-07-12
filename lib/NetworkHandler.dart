import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'dart:convert';

class NetworkHandler {
  String baseurl = 'https://backendpfa.herokuapp.com';
  var log = Logger();

  Future<http.Response> get(String url) async {
   url=formater(url);
   var response =await http.get(url);
   log.i(response.body);
   log.i(response.statusCode);
   return response;
  }

  Future<http.Response> post(String url , Map<String, String> body) async {
    url=formater(url);
    var response = await http.post(
      url,
      body: json.encode(body),
      headers: {
        "Content-type": "application/json"
      },
    );
    log.i(json.encode(body));
    log.i(response.body);
    log.i(response.statusCode);
    return response;
  }

  Future<http.Response> put(String url , Map<String, String> body) async {
    url=formater(url);
    var response = await http.put(
      url,
      body: json.encode(body),
      headers: {
        "Content-type": "application/json"
      },
    );
    log.i(json.encode(body));
    log.i(response.body);
    log.i(response.statusCode);
    return response;
  }

  Future<http.Response> putcons(String url , Map<String, List> body) async {
    url=formater(url);
    var response = await http.put(
      url,
      body: json.encode(body),
      headers: {
        "Content-type": "application/json"
      },
    );
    log.i(json.encode(body));
    log.i(response.body);
    log.i(response.statusCode);
    return response;
  }



  String formater(String url) {
    return baseurl+url;
  }


}