import 'package:awok_starter/data/api/HttpManager.dart';
import 'package:awok_starter/data/api/constant_network.dart';

class DashboardApiManager {
  Future<dynamic> getHomeAPI(String page) async {
    return apiManager.makeRequest(HttpMethods.GET, APIs().apiHomeWithPage(page), null);
  }
   Future<dynamic> getFlashAPI() async {
    return apiManager.makeRequest(HttpMethods.GET, APIs().apiFlash, null);
  }
   Future<dynamic> addToCart(String hash) async {
    return apiManager.makeRequest(HttpMethods.POST, APIs().addToCart, null);
  }
}
