import 'package:awok_starter/data/api/HttpManager.dart';
import 'package:awok_starter/data/api/constant_network.dart';

class ProductAPI {
Future<dynamic> fetchProdutDetail(String productId) async {
  return  apiManager.makeRequest(
        HttpMethods.GET, APIs().apiProductDetail(productId), null);
  }
Future<dynamic>    fetchProductImages(String productID) async{
  return apiManager.makeRequest(HttpMethods.GET, APIs().apiProductImages(productID), null);
}

}
