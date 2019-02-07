import 'package:awok_starter/entities/ProductDetail.dart';
import 'package:awok_starter/repository/BaseRepository.dart';
import 'package:awok_starter/ui/CounterWidget.dart';
import 'package:awok_starter/data/api/ProductAPI.dart';
import 'package:awok_starter/data/api/CartApiProvider.dart';
import 'package:awok_starter/entities/CartModel.dart';

class ApiRepository extends BaseRepository {
  @override
  Future<User> getData() async => await UserNetwork().getNetworkUser();

  @override
  Future<ProductDetail> getProductDetail(String productID) async {
    //todo change here
    return ProductAPI()
        .fetchProdutDetail(productID)
        .then((onValue) => ProductDetail.fromJson(onValue));
  }
   @override
  Future<CartModel> getCartData() async {
    //todo change here
    return Apiprovider()
        .fecthcartResults()
        .then((onValue) => CartModel.fromJson(onValue));
  }
}
