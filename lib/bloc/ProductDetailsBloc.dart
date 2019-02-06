import 'dart:async';

import 'package:awok_starter/bloc/NativeBlockProvider.dart';
import 'package:awok_starter/entities/ProductDetail.dart';
class ProductDetaisBloc extends BlocBase {
  StreamController<ProductDetail> _streamController = StreamController();
  Sink<ProductDetail> get sink => _streamController.sink;
  Stream<ProductDetail> get stream => _streamController.stream;

  ProductDetail myProduct;

  ProductDetaisBloc() {

      myProduct= ProductDetail();
      //todo initialise it to empty 
      myProduct.id="";
      myProduct.name="";
      fetchProductDetails();
  }

  @override
  void dispose() {
    _streamController.close();
  }

  fetchProductDetails(){
   sink.add(myProduct);
   Future.delayed(Duration(seconds: 3),(){
     ProductDetail productDetail= ProductDetail();
     productDetail.name="Mione Hero 3, 4G Dual Sim, 32GB, 5.7” IPS, Black";
     productDetail.imageUrl="https://s5d.awokcdn.com/static/images/products/iblock-e8b-e8bae98b4f024ca040afb0f0912c165a.jpg/default.jpg";
    sink.add(productDetail);
   });
  }


}
