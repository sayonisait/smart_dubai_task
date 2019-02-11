import 'package:awok_starter/data/api/HttpManager.dart';
import 'package:awok_starter/data/api/constant_network.dart';

class Apiprovider {
  Future<dynamic> fecthcartResults() async {
    return apiManager.makeRequest(HttpMethods.GET, APIs().apiCart, null);
  }
}
