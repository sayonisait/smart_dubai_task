import 'package:awok_starter/data/api/HttpManager.dart';
import 'package:awok_starter/data/api/constant_network.dart';

class HomeApiProvider {
  Future<dynamic> getHomeAPI(int page) async {
    return apiManager.makeRequest(HttpMethods.GET, APIs().apiHome(page,20), null);
  }
   Future<dynamic> getFlashAPI() async {
    return apiManager.makeRequest(HttpMethods.GET, APIs().apiFlash, null);
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
