
import 'package:awok_starter/entities/Product.dart';
import 'package:awok_starter/entities/ProductImages.dart';
import 'package:awok_starter/entities/AddToCart.dart';
import 'package:awok_starter/entities/CategoryModal.dart';
import 'package:awok_starter/entities/FlashProducts.dart';
import 'package:awok_starter/entities/Offer.dart';
import 'package:awok_starter/entities/Products.dart';
import 'package:awok_starter/repository/BaseRepository.dart';
import 'package:awok_starter/ui/CounterWidget.dart';
import 'package:awok_starter/entities/CartModel.dart';

class MockRepository extends BaseRepository {
  @override
  Future<User> getData() async => await UserMock().getMockedUser();

  @override
  Future<Product> getProductDetail(String productID) {
    return null;
  }

  @override
  Future<ProductImages> getProductImages(String productID) {
    // TODO: implement getProductImages
    return null;
  }
   @override
  Future<CartModel> getCartData() {
    return null;
  }

  @override
  Future<Products> getProducts(String page) {
    return null;
  }
  @override
  Future<FlashProducts> getFlashProducts() {
    return null;
  }
  @override
  Future<AddToCart> postAddToCart(String hash) {
    return null;
  }
  @override
  Future<Offer> getOffer() {
    return null;
  }
  @override
  Future<Category> getCategories() {
    return null;
  }


}