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

  Future<http.StreamedResponse> patchfile(String url, String filepath) async {
    url = formater(url);
    var request = http.MultipartRequest('PATCH', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath("csv", filepath));
    request.headers.addAll({
      "Content-type": "multipart/form-data",
    });
    var response = request.send();
    return response;
  }

  String formater(String url) {
    return baseurl+url;
  }


}