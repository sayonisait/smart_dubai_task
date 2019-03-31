import 'dart:async';
import 'dart:core';

import 'package:awok_starter/bloc/NativeBlockProvider.dart';
import 'package:awok_starter/di/DependencyInjection.dart';
import 'package:awok_starter/entities/Product.dart';
import 'package:awok_starter/entities/ProductDetails.dart';
import 'package:awok_starter/repository/BaseRepository.dart';

class ProductDetaisBloc extends BlocBase {
  
  StreamController<ProductDetails> _streamController = StreamController();
  Sink<ProductDetails> get sink => _streamController.sink;
  Stream<ProductDetails> get stream => _streamController.stream;

  StreamController<ProductDetailAction> _actionController=StreamController();
  Sink<ProductDetailAction> get sinkUserEvent=>_actionController.sink;

  //ADD TO CART STREAM- Stream for Add to cart response events
  StreamController<AddedProduct> _addToCartController = StreamController();
  Sink<AddedProduct> get _sinkAddToCart => _addToCartController.sink;
  Stream<AddedProduct> get streamToCart => _addToCartController.stream;



  ProductDetails myProduct;

  ProductDetaisBloc(ProductData product) {
    init(product);
    fetchAlldata(product.id);
  }

  init(ProductData product) {
    myProduct = new ProductDetails();
    myProduct.product=product;
    
    myProduct.images = new List();
    myProduct.deliveryInfo = new List();
    sink.add(myProduct);
  
    _actionController.stream.listen((action) async {
        if(action is ChangeVariantAction){
          fetchAlldata(action.productID);
        }else if(action is AddToCartAction){

          AddedProduct product=AddedProduct();
          //todo proper null checks
          product.productImageURL=myProduct.images[0].custom;
          product.productName=myProduct.product.name;
          product.productPrice=myProduct.product.prices.current+" "+myProduct.product.prices.currency;
          
          product.addedStatus=AddedProduct.ADDING;
          _addToCartController.sink.add(product);

         await new  Future.delayed(Duration(seconds: 3));
             product.addedStatus=AddedProduct.ADDED;
            _addToCartController.sink.add(product);
        }
    
        
    });
  }

  fetchAlldata(String id){
    fetchProductDetails(id);
    fetchProductImages(id);
    fetchDeliveryInfo(id);
  }

  @override
  void dispose() {
    _streamController.close();
    _actionController.close();
    _addToCartController.close();
  }

  fetchProductDetails(String productID) {
    BaseRepository base = Injector().getRepository;
    base.getProductDetail(productID).then((onValue) {
      if(onValue.status.code==200){
        myProduct.product = onValue.output.data;
        sink.add(myProduct);
        print("product details fetched and added to stream");
      }
      
    
    });
  }

  fetchProductImages(String productID) {
    BaseRepository base = Injector().getRepository;
    base.getProductImages(productID).then((onValue) {
      if (onValue != null &&
          onValue.output != null &&
          onValue.output.data != null)
        myProduct.images = onValue.output.data;
      else
        myProduct.images = new List();
      sink.add(myProduct);
              print("product imkages fetched and added to stream");

    });
  }

  fetchDeliveryInfo(String productID) {
    BaseRepository base = Injector().getRepository;
    base.getDeliveryInfo(productID).then((onValue) {
      if (onValue != null &&
          onValue.output != null &&
          onValue.output.data != null)
        myProduct.deliveryInfo = onValue.output.data;
      else
        myProduct.deliveryInfo = new List();
    });
  }
}

abstract class ProductDetailAction{

}

class ChangeVariantAction extends ProductDetailAction{

  String productID;

  ChangeVariantAction( this.productID);

}

class AddToCartAction extends ProductDetailAction{

  String productID;

  AddToCartAction( this.productID);

}

class AddedProduct {
  static final ADDING=1, ADDED=0,NOT_ADDED=3;
  int addedStatus;
  String productName;
  String productPrice;
  String productImageURL;
  
  
}
