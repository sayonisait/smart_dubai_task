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
  StreamController<FlashProducts> _flashStreamController =
      StreamController<FlashProducts>.broadcast();
  Sink<FlashProducts> get updateFlashProduct => _flashStreamController.sink;
  Stream<FlashProducts> get myFlashProducts => _flashStreamController.stream;

  StreamController _productStreamController = StreamController.broadcast();
  Sink<dynamic> get updateProduct => _productStreamController.sink;
  Stream<dynamic> get myProducts => _productStreamController.stream;

  StreamController<AddToCart> _addToCartStreamController =
      StreamController<AddToCart>.broadcast();
  Sink<AddToCart> get updateCartProduct => _addToCartStreamController.sink;

  Stream<AddToCart> get addCart => _addToCartStreamController.stream;

  DashboardBloc() {
    init();
  }

  init() {
    // _productStreamController.stream.listen(aysha);
     getFlashProducts();
    getProducts();
   
  }

  @override
  void dispose() {
     _flashStreamController.close();
    _productStreamController.close();
    _addToCartStreamController.close();
  }

  getProducts() async {
    BaseRepository base = Injector().getRepository;
    
    base.getProducts(1).then((onValue) {// changed by sayoni for testing
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
