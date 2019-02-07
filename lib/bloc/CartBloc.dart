import 'dart:async';
import 'package:awok_starter/data/api/HttpManager.dart';
import 'package:awok_starter/bloc/NativeBlockProvider.dart';
import 'package:awok_starter/entities/CartModel.dart';


class CartBloc extends BlocBase {
 Cart products;
 StreamController _cartStreamController = StreamController<Cart>();
 Stream<Cart> get myProducts => _cartStreamController.stream;
 StreamSink<Cart> get updateProduct => _cartStreamController.sink;

 // int count;
 // final _streamController = StreamController<int>();
 // StreamSink<int> get getCount => _streamController.sink;
 // Stream<int> get myCount => _streamController.stream;

 CartBloc() {
   init();
 }
 init() {
   //count = 0;
   getcartProduts();
 }

 // updateProductWithPagination() {
 //   updateProduct.add(products);
 // }

 @override
 void dispose() {
   // TODO: implement dispose
   _cartStreamController.close();
 }

 getcartProduts() async {
    return await apiManager.makeRequest(HttpMethods.GET, "https://ae.awok.com/api//v2/cart/").then((onValue) {
      _cartStreamController.sink.add(cartFromJson(onValue));
    }).catchError((onError) {
      _cartStreamController.addError(onError.toString());
    });

   

 }
}
