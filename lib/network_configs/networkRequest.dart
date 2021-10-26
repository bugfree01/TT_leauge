import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

import 'app_mailer.dart';

class NetworkRequest {
  Future<Map<String, dynamic>> networkCallPost(
      {required String targetURL,
         Map<String, dynamic>? requestParms}) async {

    var jsonResponse = {};
    try {
      // String parameterSETStr = json.encode(requestParms);
      //
      // print("REQUEST_URL=> ${targetURL}");
      // print("REQUEST_PARMS=> ${parameterSETStr}");
      //
      // List<int> bodyBytes = utf8.encode(parameterSETStr);
      // HttpClient _httpClient = HttpClient();
      //
      // HttpClientRequest request =
      // await _httpClient.postUrl(Uri.parse(targetURL));
      //
      // request.headers.set('Content-Type', 'application/json');
      // request.add(bodyBytes);
      //
      // var resp = await request.close();
      //
      // var responseBody = await resp.transform(utf8.decoder).join();

      var response = await http.post(targetURL);

      print("RESPONSE=> ${response.body.toString()}");
      return json.decode(response.body.toString());
    } catch (e) {
      return <String, dynamic>{};
    } finally {
      print("REQUEST_RESULT=> ${jsonResponse}");
    }


  }

  Future<Map<String, dynamic>> networkCallPostMap(
      String url, {Map<String, dynamic>? parameter}) async {
    try {
      String jsonString = json.encode(parameter);

      print("=>$jsonString");
      List<int> bodyBytes = utf8.encode(jsonString);
      HttpClient _httpClient = HttpClient();
      HttpClientRequest request = await _httpClient.postUrl(Uri.parse(url));
      request.headers.set('Content-Length', bodyBytes.length.toString());
      request.add(bodyBytes);
      var resp = await request.close();
      var responseBody = await resp.transform(utf8.decoder).join();
      // var responseBody = await resp.stream.bytesToString();

      print(" API: RESP: Url: $url => : ${responseBody.toString()}");

      return json.decode(responseBody);
    } catch (e) {
      print("url:$url ERROR IN API CALL: $e");
      return <String, dynamic>{};
    }
  }

  String getErrorHTMLBody(
          {required String targetURL, var varPrameter, var errorData}) =>
      "<p>URL : ${targetURL},"
      "<br/> PARAMETER : ${varPrameter.toString()} "
      "<br/> ERROR TRACE : ${errorData}</p>";
}
