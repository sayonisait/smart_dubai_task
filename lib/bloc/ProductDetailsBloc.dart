import 'dart:async';

import 'package:awok_starter/bloc/NativeBlockProvider.dart';
import 'package:awok_starter/di/DependencyInjection.dart';
import 'package:awok_starter/entities/ProductDetail.dart';
import 'package:awok_starter/repository/BaseRepository.dart';
class ProductDetaisBloc extends BlocBase {
  StreamController<ProductDetail> _streamController = StreamController();
  Sink<ProductDetail> get sink => _streamController.sink;
  Stream<ProductDetail> get stream => _streamController.stream;

  ProductDetail myProduct;

  ProductDetaisBloc() {
        fetchProductDetails();
  }

  @override
  void dispose() {
    _streamController.close();
  }

  fetchProductDetails(){


     BaseRepository base = Injector().getRepository;
     //todo change productid
    base.getProductDetail("1360927").then((onValue) {
      myProduct = onValue;
    sink.add(myProduct);
    });
   
  
  }


}
