

import 'dart:convert';

class CartDT{
  static CartModel cartFromJson(Map<String, dynamic> json) {
    return CartModel.fromJson(json);
  }

  static String cartToJson(CartModel data) {
    final dyn = data.toJson();
    return json.encode(dyn);
  }
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

  Map<String, dynamic> toJson() => {
        "API": api.toJson(),
        "STATUS": status.toJson(),
        "OUTPUT": output.toJson(),
      };
}

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

  Map<String, dynamic> toJson() => {
        "MIN_APP_VER": minAppVer,
        "MIN_APP_VERSION": minAppVersion,
        "VERSION": version,
        "FORMAT": format,
        "LANG": lang,
        "CURRENCY": currency,
        "HTTP_METHOD": httpMethod,
        "CURRENCY_SYM": currencySym,
        "URI": uri.toJson(),
      };
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

  Map<String, dynamic> toJson() => {
        "SOURCE": source,
        "PARSED": parsed,
      };
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

  Map<String, dynamic> toJson() => {
        "DATA": data.toJson(),
        "NAVIGATION": navigation.toJson(),
      };
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

  Map<String, dynamic> toJson() => {
        "BASKET": new List<dynamic>.from(basket.map((x) => x.toJson())),
        "SUMMARY": summary.toJson(),
      };
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

  Map<String, dynamic> toJson() => {
        "ITEMS": new List<dynamic>.from(items.map((x) => x.toJson())),
        "SUMMARY": summary.toJson(),
        "STORE": store.toJson(),
      };
}

class Item {
  ItemBasket basket;
  Prices prices;
  Quantity quantity;
  Imagee image;

  Item({
    this.basket,
    this.prices,
    this.quantity,
    this.image,
  });

  factory Item.fromJson(Map<String, dynamic> json) => new Item(
        basket: ItemBasket.fromJson(json["BASKET"]),
        prices: Prices.fromJson(json["PRICES"]),
        quantity: Quantity.fromJson(json["QUANTITY"]),
        image: Imagee.fromJson(json["IMAGE"]),
      );

  Map<String, dynamic> toJson() => {
        "BASKET": basket.toJson(),
        "PRICES": prices.toJson(),
        "QUANTITY": quantity.toJson(),
        "IMAGE": image.toJson(),
      };
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
        fulfilled: json["FULFILLED"] == null ? null : json["FULFILLED"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "PRODUCT_ID": productId,
        "NAME": name,
        "FULFILLED": fulfilled == null ? null : fulfilled,
      };
}

class Imagee {
  String thumb;

  Imagee({
    this.thumb,
  });

  factory Imagee.fromJson(Map<String, dynamic> json) => new Imagee(
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

  Map<String, dynamic> toJson() => {
        "MSRP": msrp,
        "CURRENT": current,
        "CURRENCY": currency,
      };
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

  Map<String, dynamic> toJson() => {
        "CURRENT": current,
        "MAX": max,
      };
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

  Map<String, dynamic> toJson() => {
        "STORE_ID": storeId,
        "STORE_NAME": storeName,
      };
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

  Map<String, dynamic> toJson() => {
        "ITEMS": items,
        "PRICE": price,
        "CURRENCY": currency,
        "STORES": stores == null ? null : stores,
      };
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

  Map<String, dynamic> toJson() => {
        "CODE": code,
        "MESSAGE": message,
      };
}
