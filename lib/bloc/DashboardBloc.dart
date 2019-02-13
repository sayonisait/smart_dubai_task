import 'package:awok_starter/bloc/NativeBlockProvider.dart';
import 'package:awok_starter/di/DependencyInjection.dart';
import 'package:awok_starter/entities/AddToCart.dart';
import 'package:awok_starter/entities/FlashProducts.dart';
import 'package:awok_starter/entities/Products.dart';
import 'package:awok_starter/repository/BaseRepository.dart';
import 'dart:async';

class DashboardBloc extends BlocBase {
  Products products;
  FlashProducts flashProducts;

  StreamController _productStreamController = StreamController.broadcast();
  Stream<dynamic> get myProducts => _productStreamController.stream;
  StreamSink<dynamic> get updateProduct => _productStreamController.sink;

  StreamController<FlashProducts> _flashStreamController = StreamController<FlashProducts>.broadcast();
  Stream<FlashProducts> get myFlashProducts => _flashStreamController.stream;
  StreamSink<FlashProducts> get updateFlashProduct =>
      _flashStreamController.sink;

  StreamController _addToCartStreamController = StreamController<AddToCart>();
  Stream<AddToCart> get addCart => _addToCartStreamController.stream;
  StreamSink<AddToCart> get updateCartProduct => _addToCartStreamController.sink;

  DashboardBloc() {
    init();
  }

  init() {
    // _productStreamController.stream.listen(aysha);
    getProducts();
    getFlashProducts();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _productStreamController.close();
    _flashStreamController.close();
    _addToCartStreamController.close();
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
}
