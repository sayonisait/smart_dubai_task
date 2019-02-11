

import 'package:awok_starter/entities/FlashProducts.dart';
import 'package:awok_starter/entities/ProductDetail.dart';
import 'package:awok_starter/entities/CartModel.dart';
import 'package:awok_starter/entities/Products.dart';
import 'package:awok_starter/ui/CounterWidget.dart';

abstract class BaseRepository {
  Future<ProductDetail> getProductDetail(String productID);
  Future<User> getData();
  Future<CartModel> getCartData();
  Future<Products> getProducts(String page);
  Future<FlashProducts> getFlashProducts();


}
