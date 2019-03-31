import 'dart:async';

import 'package:awok_starter/bloc/NativeBlockProvider.dart';
import 'package:awok_starter/di/DependencyInjection.dart';
import 'package:awok_starter/entities/Item.dart';
import 'package:awok_starter/repository/BaseRepository.dart';

class HomePageOldBloc extends BlocBase {
  StreamController<HomePageData> _streamController = StreamController();
  Sink<HomePageData> get _sink => _streamController.sink;
  Stream<HomePageData> get stream => _streamController.stream;

  StreamController<HomePageEvent> _actionController = StreamController();

  Sink<HomePageEvent> get event => _actionController.sink;
  Stream<HomePageEvent> get eventStream => _actionController.stream;

  bool isLoading = false;
  int pageNumber = 0;
  List<Item> items;
  HomePageData homePageData;

  @override
  void dispose() {
    _streamController.close();
    _actionController.close();
  }

  HomePageOldBloc() {
    eventStream.listen(_mapEventToState);
    homePageData = new HomePageData();
    homePageData.products = new List();
    homePageData.flashSales = new List();
    getHomePageContent();
    getFlashSales();
  }

  void _mapEventToState(HomePageEvent event) {
    if (event is LoadMoreEvent) getHomePageContent();
  }

  void loadMore(String data) {
    getHomePageContent();
  }

  getHomePageContent() async {
    if (!isLoading) {
      isLoading = true;
      pageNumber++;
      BaseRepository base = Injector().getRepository;
      base.getProducts(pageNumber).then((onValue) {
        print(onValue.toString());
        if (onValue != null &&
            onValue.output != null &&
            onValue.output.data != null) {
          if (onValue.output.data.items != null) {
            homePageData.products.addAll(onValue.output.data.items);
            homePageData.title = onValue.output.data.title;
          }
          if (onValue.output.data.banner != null)
            homePageData.bannerUrl = onValue.output.data.banner.url;

          _sink.add(homePageData);
        }
        isLoading = false;
      })
      // .catchError((onError) {
      //   print(onError);
      //   _streamController.sink.addError(onError);
      // })
      ;
    }
  }

  getFlashSales() async {
    BaseRepository base = Injector().getRepository;
    base.getFlashProducts().then((onValue) {
      print(onValue.toString());
      if (onValue != null &&
          onValue.output != null &&
          onValue.output.data != null &&
          onValue.output.data.items != null) {
          homePageData.flashSales.addAll(onValue.output.data.items);
        homePageData.flashTitle = onValue.output.data.title;
      }

      _sink.add(homePageData);
    })
    // .catchError((onError) {
    //   print(onError);
    //   _streamController.sink.addError(onError);
    // })
    ;
  }
}

abstract class HomePageEvent {}

class LoadMoreEvent extends HomePageEvent {}

class AddToCartEvent extends HomePageEvent {
  AddToCartEvent(String productID) {
    
  }
}

class HomePageData {
  List<Item> products;
  String bannerUrl;
  String title;
  List<Item> flashSales;
  String flashTitle;
}
