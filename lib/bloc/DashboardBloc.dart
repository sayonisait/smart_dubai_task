import 'package:awok_starter/bloc/NativeBlockProvider.dart';
import 'package:awok_starter/di/DependencyInjection.dart';
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

  StreamController _flashStreamController = StreamController<FlashProducts>();
  Stream<FlashProducts> get myFlashProducts => _flashStreamController.stream;
  StreamSink<FlashProducts> get updateFlashProduct =>
      _flashStreamController.sink;

  DashboardBloc() {
    init();
  }

  init() {
    //count = 0;
    // _productStreamController.stream.listen(aysha);
    // getHomeProducts();
    // getFlashProducts();

    getProducts();
    getFlashProducts();
  }

  // updateProductWithPagination() {
  //   updateProduct.add(products);
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    _productStreamController.close();
    _flashStreamController.close();
  }

  // getHomeProducts() async {
  //   return await apiManager
  //       .getHomeAPI('/home/?PAGED=1&IW=295&IH=295&PER_PAGE=20')
  //       .then((onValue) {
  //     updateProduct.add(productsFromJson(onValue));
  //   });
  // }

  // getFlashProducts() async {
  //   return await apiManager.getFlashAPI('/flash/').then((onValue) {
  //     updateFlashProduct.add(flashProductsFromJson(onValue));
  //   });
  // }

  aysha(event) {
    print(event);
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
}
