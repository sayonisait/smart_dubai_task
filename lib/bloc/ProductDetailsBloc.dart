import 'dart:async';

import 'package:awok_starter/bloc/NativeBlockProvider.dart';
import 'package:awok_starter/di/DependencyInjection.dart';
import 'package:awok_starter/entities/Product.dart';
import 'package:awok_starter/entities/ProductDetails.dart';
import 'package:awok_starter/entities/ProductImages.dart';
import 'package:awok_starter/repository/BaseRepository.dart';

class ProductDetaisBloc extends BlocBase {
  StreamController<ProductDetails> _streamController = StreamController();
  Sink<ProductDetails> get sink => _streamController.sink;
  Stream<ProductDetails> get stream => _streamController.stream;
  String productID;
  ProductDetails myProduct;
  

  ProductDetaisBloc(String id) {
    print("fetching");
    productID=id;

    myProduct= new ProductDetails();
    myProduct.images=new List();
    sink.add(myProduct);
        fetchProductDetails();
        fetchProductImages();

  }

  @override
  void dispose() {
    _streamController.close();
  }

  fetchProductDetails() {
    BaseRepository base = Injector().getRepository;
    base.getProductDetail(productID).then((onValue) {
      myProduct.product = onValue;
      sink.add(myProduct);
    });
  }

  fetchProductImages(){
    BaseRepository base=Injector().getRepository;
    base.getProductImages(productID).then((onValue){
      print(" image response"+onValue.toString());
      if(onValue!=null && onValue.output!=null && onValue.output.data!=null)
        myProduct.images = onValue.output.data;
      else
        myProduct.images=new List();
      sink.add(myProduct);
    });
  }
}
