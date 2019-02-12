import 'dart:io';
import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http;

enum HttpMethods { POST, GET }

ApiManager apiManager = ApiManager();

class ApiManager {
  Map<String, String> getHeader() {
    return {
      "Authorization":
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiOTg1ODYiLCJ0b2tlbiI6IjkxYzQ0Mjk4Nzg4MDRjNWIxOGFhYjE1M2FhYzU2ZTY1In0.Wo36u205EjqKN1myYb4St0oTC_PiJrLOPNuV6284HZQ",
     
    };
  }

  Future<dynamic> makeRequest(
      HttpMethods method, String uri, Map params) async {
    print(params);
    http.Response response;
    switch (method) {
      case HttpMethods.GET:
        response = await http.get(uri, headers: getHeader());
        break;
      case HttpMethods.POST:
       var body = {
  "hash"  :  "7b224944223a223438323234222c22434e223a3334303433382c2248223a226536393932333630323430303230323332323938393064396532366461326238227d"
};
    

        response = await http.post(uri,
            headers: {"Authorization":
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMjQ4NTUyNCIsInRva2VuIjoiODIzZDRiM2NmMGVjZGJlOTc1MWYzODU0MmQ4M2M2M2UifQ.-IbIA9p_gYM2vRR6xU2GNXvnQGz3oiddzPH5iShq_ew"
    }, body: body);
     print(response.body);

        // var httpClient = new HttpClient();
        // var uri = new Uri.https('api.github.com', '/users/1');
        // var request = await httpClient.postUrl(uri);
        // request.headers.set('content-type', 'application/json');
        // request.headers.set('Authorization',
        //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiOTg1ODYiLCJ0b2tlbiI6IjkxYzQ0Mjk4Nzg4MDRjNWIxOGFhYjE1M2FhYzU2ZTY1In0.Wo36u205EjqKN1myYb4St0oTC_PiJrLOPNuV6284HZQ');
        // request.add(utf8.encode(json.encode(params)));
        // var response = await request.close();
        // var responseBody = await response.transform(utf8.decoder).join();

        // return responseBody;

        // HttpClient httpClient = new HttpClient();
        // HttpClientRequest request = await httpClient.postUrl(Uri.parse(uri));
        // request.headers.set('content-type', 'application/json');
        // request.headers.set('Authorization',
        //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiOTg1ODYiLCJ0b2tlbiI6IjkxYzQ0Mjk4Nzg4MDRjNWIxOGFhYjE1M2FhYzU2ZTY1In0.Wo36u205EjqKN1myYb4St0oTC_PiJrLOPNuV6284HZQ');
        // request.add(utf8.encode(json.encode(params)));
        // HttpClientResponse response = await request.close();
        // // todo - you should check the response.statusCode
        // String reply = await response.transform(utf8.decoder).join();
        // httpClient.close();
        //

        print('MY RES $response');
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
    String asd = "";
    queryParsms.forEach((key, value) => asd += key + "=" + value + "&");
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
