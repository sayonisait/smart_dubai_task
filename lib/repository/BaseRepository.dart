

import 'package:awok_starter/entities/ProductDetail.dart';
import 'package:awok_starter/entities/CartModel.dart';
import 'package:awok_starter/ui/CounterWidget.dart';

abstract class BaseRepository {
  Future<ProductDetail> getProductDetail(String productID);
  Future<User> getData();
    Future<CartModel> getCartData();

}
