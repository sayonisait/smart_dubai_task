import 'package:awok_starter/entities/Product.dart';
import 'package:awok_starter/entities/ProductDelivery.dart';
import 'package:awok_starter/entities/ProductImages.dart';
import 'package:awok_starter/data/api/DashboardAPIManager.dart';
import 'package:awok_starter/data/api/HomeApiProvider.dart';
import 'package:awok_starter/entities/AddToCart.dart';
import 'package:awok_starter/entities/CategoryModal.dart';
import 'package:awok_starter/entities/FlashProducts.dart';
import 'package:awok_starter/entities/Offer.dart';
import 'package:awok_starter/entities/Products.dart';
import 'package:awok_starter/repository/BaseRepository.dart';
import 'package:awok_starter/ui/CounterWidget.dart';
import 'package:awok_starter/data/api/ProductAPI.dart';
import 'package:awok_starter/data/api/CartApiProvider.dart';
import 'package:awok_starter/entities/CartModel.dart';

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
   @override
  Future<CartModel> getCartData() async {
    //todo change here
    return Apiprovider()
        .fecthcartResults()
        .then((onValue) => CartModel.fromJson(onValue));
  }
@override
  Future<Products> getProducts(int pageNumber) async {
    //todo change here
    return DashboardApiManager()
        .getHomeAPI(pageNumber)
        .then((onValue) => Products.fromJson(onValue));
  }

  

@override
  Future<FlashProducts> getFlashProducts() async {
    //todo change here
    return DashboardApiManager()
        .getFlashAPI()
        .then((onValue) => FlashProducts.fromJson(onValue));
  }
@override
  Future<AddToCart> postAddToCart(String hash) async {
    //todo change here
    return DashboardApiManager()
        .addToCart(hash)
        .then((onValue) => AddToCart.fromJson(onValue));
  }
@override
  Future<Offer> getOffer() async {
    //todo change here
    return HomeApiProvider()
        .getOfferAPI()
        .then((onValue) => Offer.fromJson(onValue));
  }
@override
  Future<Category> getCategories() async {
    //todo change here
    return HomeApiProvider()
        .getCategoryAPI()
        .then((onValue) => Category.fromJson(onValue));
  }

  @override
  Future<Delivery> getDeliveryInfo(String productID) {
   return ProductAPI().fetchDeliveryInfo(productID).then((onValue)=>

     Delivery.fromJson(onValue));
  }
}
