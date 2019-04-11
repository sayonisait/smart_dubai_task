import 'package:awok_starter/data/api/HttpManager.dart';
import 'package:awok_starter/data/api/constant_network.dart';

class DashboardApiManager {
  Future<dynamic> getHomeAPI(int page) async {
    return apiManager.makeRequest(HttpMethods.GET, APIs().apiHome(page,20), null);
  }
   Future<dynamic> getFlashAPI() async {
    return apiManager.makeRequest(HttpMethods.GET, APIs().apiFlash, null);
  }
  
}
