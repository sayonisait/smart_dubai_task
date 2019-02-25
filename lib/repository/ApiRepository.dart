import 'package:awok_starter/entities/Product.dart';
import 'package:awok_starter/entities/ProductImages.dart';
import 'package:awok_starter/repository/BaseRepository.dart';
import 'package:awok_starter/ui/CounterWidget.dart';
import 'package:awok_starter/data/api/ProductAPI.dart';

class ApiRepository extends BaseRepository {
  @override
  Future<User> getData() async => await UserNetwork().getNetworkUser();

  @override
  Future<Product> getProductDetail(String productID) async {
    return ProductAPI()
        .fetchProdutDetail(productID)
        .then((onValue) => Product.fromJson(onValue));
  }

  @override
  Future<ProductImages> getProductImages(String productID) {
    return ProductAPI().fetchProductImages(productID).then((onValue){
      
      print("Response:"+onValue.toString());
    return ProductImages.fromJson(onValue);
    }); 
  }
}
