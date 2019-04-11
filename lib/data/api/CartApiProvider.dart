import 'package:awok_starter/data/api/HttpManager.dart';
import 'package:awok_starter/data/api/constant_network.dart';

class CartAPIProvider {
  Future<dynamic> fecthcartResults() async {
    return apiManager.makeRequest(HttpMethods.GET, APIs().apiCart, null);
  }

  Future<dynamic> addToCart(String hash) async {
    return apiManager
        .makeRequest(HttpMethods.POST, APIs().addToCart, {"hash": hash});
  }
}
