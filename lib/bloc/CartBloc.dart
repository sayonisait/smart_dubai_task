import 'dart:async';
import 'package:awok_starter/bloc/NativeBlockProvider.dart';
import 'package:awok_starter/entities/CartModel.dart';
import 'package:awok_starter/repository/BaseRepository.dart';
import 'package:awok_starter/di/DependencyInjection.dart';

class CartBloc extends BlocBase {
  StreamController<CartModel> _streamController = StreamController();
  Sink<CartModel> get sink => _streamController.sink;
  Stream<CartModel> get stream => _streamController.stream;

  CartModel myProduct;
  CartBloc() {
    init();
  }
  init() {
    getcartProduts();
  }

  @override
  void dispose() {
    _streamController.close();
  }

  getcartProduts() async {
    BaseRepository base = Injector().getRepository;
 base.getCartData().then((onValue) {
      print(onValue.toString());
      sink.add(onValue);
    }).catchError((onError) {
      _streamController.addError(onError.toString());
    });
  }
}
