import 'package:awok_starter/bloc/NativeBlockProvider.dart';
import 'package:awok_starter/di/DependencyInjection.dart';
import 'package:awok_starter/entities/AddToCart.dart';
import 'package:awok_starter/entities/CategoryModal.dart';
import 'package:awok_starter/entities/FlashProducts.dart';
import 'package:awok_starter/entities/Offer.dart';
import 'package:awok_starter/entities/Products.dart';
import 'package:awok_starter/repository/BaseRepository.dart';
import 'dart:async';

class NewHomeBloc extends BlocBase {
  
  int pageNumber;
  StreamController<Offer> _offerStreamController =
      StreamController<Offer>.broadcast();
  Sink<Offer> get updateOffer => _offerStreamController.sink;
  Stream<Offer> get offerProducts => _offerStreamController.stream;

  StreamController<FlashProducts> _flashStreamController =
      StreamController<FlashProducts>.broadcast();
  Sink<FlashProducts> get updateFlashProduct => _flashStreamController.sink;
  Stream<FlashProducts> get myFlashProducts => _flashStreamController.stream;

  StreamController<Category> _categoryStreamController =
      StreamController<Category>.broadcast();
  Sink<Category> get updateCategory => _categoryStreamController.sink;
  Stream<Category> get categoryProducts => _categoryStreamController.stream;

  StreamController<Products> _productStreamController = StreamController<Products>.broadcast();
  Sink<Products> get updateProduct => _productStreamController.sink;
  Stream<Products> get myProducts => _productStreamController.stream;

  StreamController<int> _productPaginationStreamController = StreamController<int>.broadcast();
  Sink<int> get updatePageProduct => _productPaginationStreamController.sink;
  Stream<int> get productPaging => _productPaginationStreamController.stream;
  
  StreamController<AddToCart> _addToCartStreamController = StreamController<AddToCart>.broadcast();
  Stream<AddToCart> get addCart => _addToCartStreamController.stream;
  Sink<AddToCart> get updateCartProduct => _addToCartStreamController.sink;

  NewHomeBloc() {
    init();
  }

  init() {
    getOfferProducts();
    getFlashProducts();
    getCategoryProducts();
    getProducts();
    pageNumber = 1;
  }
nextPage() {
  pageNumber++;
  updatePageProduct.add(pageNumber);

}
  @override
  void dispose() {
    // TODO: implement dispose
    _offerStreamController.close();
    _flashStreamController.close();
    _categoryStreamController.close();
    _productStreamController.close();
    _addToCartStreamController.close();
    _productPaginationStreamController.close();
  }

  getProducts() async {
    BaseRepository base = Injector().getRepository;
    base.getProducts('PAGED=1&IW=295&IH=295&PER_PAGE=20').then((onValue) {
      print(onValue.toString());
      updateProduct.add(onValue);
    }).catchError((onError) {
      _productStreamController.addError(onError.toString());
    });
  }

  getFlashProducts() async {
    BaseRepository base = Injector().getRepository;
    base.getFlashProducts().then((onValue) {
      print(onValue.toString());
      updateFlashProduct.add(onValue);
    }).catchError((onError) {
      _flashStreamController.addError(onError.toString());
    });
  }

  postAddToCart(String hash) async {
    BaseRepository base = Injector().getRepository;
    base.postAddToCart(hash).then((onValue) {
      print(onValue.toString());
      updateCartProduct.add(onValue);
    }).catchError((onError) {
      _addToCartStreamController.addError(onError.toString());
    });
  }
  getOfferProducts() async {
    BaseRepository base = Injector().getRepository;
    base.getOffer().then((onValue) {
      print(onValue.toString());
      updateOffer.add(onValue);
    }).catchError((onError) {
      _offerStreamController.addError(onError.toString());
    });
  }

  getCategoryProducts() async {
    BaseRepository base = Injector().getRepository;
    base.getCategories().then((onValue) {
      print(onValue.toString());
      updateCategory.add(onValue);
    }).catchError((onError) {
      _categoryStreamController.addError(onError.toString());
    });
  }
}
