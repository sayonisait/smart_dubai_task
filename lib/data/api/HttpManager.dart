import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http;

enum HttpMethods { POST, GET }

ApiManager apiManager = ApiManager();

class ApiManager {
  Map<String, String> getHeader() {
    return {
      "Authorization":
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiOTg1ODYiLCJ0b2tlbiI6IjkxYzQ0Mjk4Nzg4MDRjNWIxOGFhYjE1M2FhYzU2ZTY1In0.Wo36u205EjqKN1myYb4St0oTC_PiJrLOPNuV6284HZQ"
    };
  }

  Future<dynamic> makeRequest(HttpMethods method, String uri, Map params) async {
    http.Response response;
    switch (method) {
      case HttpMethods.GET:
        response = await http.get(uri, headers: getHeader());
        break;
      case HttpMethods.POST:
        response = await http.post(uri);
        break;
    }
    final jsonBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
      throw new FetchDataException(
          "Error while  getting data [StatusCode:$statusCode, Error:${response.reasonPhrase}]");
    }
    var jsn = json.decode(jsonBody);
    return jsn;
  }

   String getQueryParameters(Map<String, String> queryParsms) {
     String asd="";
      queryParsms.forEach((key, value) =>asd+= key + "=" + value+"&");
      return asd;
   }
}

class FetchDataException implements Exception {
  String _message;

  FetchDataException(this._message);

  String toString() {
    return "Exception: $_message";
  }
}
