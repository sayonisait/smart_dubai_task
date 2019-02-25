import 'package:awok_starter/data/api/HttpManager.dart';
import 'package:awok_starter/data/api/constant_network.dart';

class HomeApiProvider {
  Future<dynamic> getHomeAPI(String page) async {
    return apiManager.makeRequest(HttpMethods.GET, APIs().apiHomeWithPage(page), null);
  }
   Future<dynamic> getFlashAPI() async {
    return apiManager.makeRequest(HttpMethods.GET, APIs().apiFlash, null);
  }
   Future<dynamic> addToCart(String hash) async {
    return apiManager.makeRequest(HttpMethods.POST, APIs().addToCart, {"hash":hash});
  }
  //Offer
  Future<dynamic> getOfferAPI() async {
    return apiManager.makeRequest(HttpMethods.GET, APIs().apiOffer, null);
  }
  //Category
  Future<dynamic> getCategoryAPI() async {
    return apiManager.makeRequest(HttpMethods.GET, APIs().apiCategory, null);
  }

}
