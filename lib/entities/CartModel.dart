// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

CartModel cartFromJson(dynamic str) {
  final jsonData = json.decode(str);
  return CartModel.fromJson(jsonData);
}

class CartModel {
  Api api;
  Status status;
  Output output;

  CartModel({
    this.api,
    this.status,
    this.output,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => new CartModel(
        api: Api.fromJson(json["API"]),
        status: Status.fromJson(json["STATUS"]),
        output: Output.fromJson(json["OUTPUT"]),
      );
} //

class Api {
  String minAppVer;
  String minAppVersion;
  String version;
  String format;
  String lang;
  String currency;
  String httpMethod;
  String currencySym;
  Uri uri;

  Api({
    this.minAppVer,
    this.minAppVersion,
    this.version,
    this.format,
    this.lang,
    this.currency,
    this.httpMethod,
    this.currencySym,
    this.uri,
  });

  factory Api.fromJson(Map<String, dynamic> json) => new Api(
        minAppVer: json["MIN_APP_VER"],
        minAppVersion: json["MIN_APP_VERSION"],
        version: json["VERSION"],
        format: json["FORMAT"],
        lang: json["LANG"],
        currency: json["CURRENCY"],
        httpMethod: json["HTTP_METHOD"],
        currencySym: json["CURRENCY_SYM"],
        uri: Uri.fromJson(json["URI"]),
      );
}

class Uri {
  String source;
  String parsed;

  Uri({
    this.source,
    this.parsed,
  });

  factory Uri.fromJson(Map<String, dynamic> json) => new Uri(
        source: json["SOURCE"],
        parsed: json["PARSED"],
      );
}

class Output {
  Data data;
  Navigation navigation;

  Output({
    this.data,
    this.navigation,
  });

  factory Output.fromJson(Map<String, dynamic> json) => new Output(
        data: Data.fromJson(json["DATA"]),
        navigation: Navigation.fromJson(json["NAVIGATION"]),
      );
}

class Data {
  List<BasketElement> basket;
  Summary summary;

  Data({
    this.basket,
    this.summary,
  });

  factory Data.fromJson(Map<String, dynamic> json) => new Data(
        basket: new List<BasketElement>.from(
            json["BASKET"].map((x) => BasketElement.fromJson(x))),
        summary: Summary.fromJson(json["SUMMARY"]),
      );
}

class BasketElement {
  List<Item> items;
  Summary summary;
  Store store;

  BasketElement({
    this.items,
    this.summary,
    this.store,
  });

  factory BasketElement.fromJson(Map<String, dynamic> json) =>
      new BasketElement(
        items: new List<Item>.from(json["ITEMS"].map((x) => Item.fromJson(x))),
        summary: Summary.fromJson(json["SUMMARY"]),
        store: Store.fromJson(json["STORE"]),
      );
}

class Item {
  ItemBasket basket;
  Prices prices;
  Quantity quantity;
  Imagess images;

  Item({
    this.basket,
    this.prices,
    this.quantity,
    this.images,
  });

  factory Item.fromJson(Map<String, dynamic> json) => new Item(
        basket: ItemBasket.fromJson(json["BASKET"]),
        prices: Prices.fromJson(json["PRICES"]),
        quantity: Quantity.fromJson(json["QUANTITY"]),
        images: Imagess.fromJson(json["IMAGE"]),
      );
}

class ItemBasket {
  String id;
  String productId;
  String name;
  String fulfilled;

  ItemBasket({
    this.id,
    this.productId,
    this.name,
    this.fulfilled,
  });

  factory ItemBasket.fromJson(Map<String, dynamic> json) => new ItemBasket(
        id: json["ID"],
        productId: json["PRODUCT_ID"],
        name: json["NAME"],
        fulfilled: json["FULFILLED"],
      );
}

class Imagess {
  String thumb;

  Imagess({
    this.thumb,
  });

  factory Imagess.fromJson(Map<String, dynamic> json) => new Imagess(
        thumb: json["thumb"],
      );

  Map<String, dynamic> toJson() => {
        "thumb": thumb,
      };
}

class Prices {
  int msrp;
  int current;
  String currency;

  Prices({
    this.msrp,
    this.current,
    this.currency,
  });

  factory Prices.fromJson(Map<String, dynamic> json) => new Prices(
        msrp: json["MSRP"],
        current: json["CURRENT"],
        currency: json["CURRENCY"],
      );
}

class Quantity {
  int current;
  int max;

  Quantity({
    this.current,
    this.max,
  });

  factory Quantity.fromJson(Map<String, dynamic> json) => new Quantity(
        current: json["CURRENT"],
        max: json["MAX"],
      );
}

class Store {
  String storeId;
  String storeName;

  Store({
    this.storeId,
    this.storeName,
  });

  factory Store.fromJson(Map<String, dynamic> json) => new Store(
        storeId: json["STORE_ID"],
        storeName: json["STORE_NAME"],
      );
}

class Summary {
  int items;
  int price;
  String currency;
  int stores;

  Summary({
    this.items,
    this.price,
    this.currency,
    this.stores,
  });

  factory Summary.fromJson(Map<String, dynamic> json) => new Summary(
        items: json["ITEMS"],
        price: json["PRICE"],
        currency: json["CURRENCY"],
        stores: json["STORES"] == null ? null : json["STORES"],
      );
}

class Navigation {
  Navigation();

  factory Navigation.fromJson(Map<String, dynamic> json) => new Navigation();

  Map<String, dynamic> toJson() => {};
}

class Status {
  int code;
  String message;

  Status({
    this.code,
    this.message,
  });

  factory Status.fromJson(Map<String, dynamic> json) => new Status(
        code: json["CODE"],
        message: json["MESSAGE"],
      );
}
