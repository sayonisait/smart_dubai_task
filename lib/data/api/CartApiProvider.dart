import 'HttpManager.dart';
//import 'package:http/http.dart' as http;

class Apiprovider {
 Future getUrl(String url, Map<String, String> header, HttpMethods method) async {
    var networkclassObjres =  await apiManager.makeRequest(method, url);
    print('cdedeeeeeee$networkclassObjres');
   return networkclassObjres;
  }

  getbaseUrl(String url) {
//

    return "https://ae.awok.com/api/"+url;
  }
}
