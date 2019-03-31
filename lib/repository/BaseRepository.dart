

import 'package:awok_starter/entities/Product.dart';
import 'package:awok_starter/entities/ProductDelivery.dart';
import 'package:awok_starter/entities/ProductImages.dart';
import 'package:awok_starter/entities/AddToCart.dart';
import 'package:awok_starter/entities/CategoryModal.dart';
import 'package:awok_starter/entities/FlashProducts.dart';
import 'package:awok_starter/entities/Offer.dart';
import 'package:awok_starter/entities/CartModel.dart';
import 'package:awok_starter/entities/Products.dart';
import 'package:awok_starter/ui/CounterWidget.dart';

abstract class BaseRepository {
  Future<Product> getProductDetail(String productID);
  Future<User> getData();
  Future<ProductImages> getProductImages(String productID);
  Future<CartModel> getCartData();
  Future<Products> getProducts(int page);
  Future<FlashProducts> getFlashProducts();
  Future<AddToCart> postAddToCart(String hash);
  Future<Offer> getOffer();
  Future<Category> getCategories();
  Future<Delivery> getDeliveryInfo(String productID);



}
