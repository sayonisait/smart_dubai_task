

import 'package:awok_starter/entities/Product.dart';
import 'package:awok_starter/entities/ProductImages.dart';
import 'package:awok_starter/ui/CounterWidget.dart';

abstract class BaseRepository {
  Future<Product> getProductDetail(String productID);
  Future<User> getData();
  Future<ProductImages> getProductImages(String productID);

}
