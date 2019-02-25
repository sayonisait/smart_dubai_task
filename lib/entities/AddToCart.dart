// To parse this JSON data, do
//
//     final addToCart = addToCartFromJson(jsonString);

import 'dart:convert';

AddToCart addToCartFromJson(String str) {
    final jsonData = json.decode(str);
    return AddToCart.fromJson(jsonData);
}

String addToCartToJson(AddToCart data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class AddToCart {
    Api api;
    Status status;
    Output output;

    AddToCart({
        this.api,
        this.status,
        this.output,
    });

    factory AddToCart.fromJson(Map<String, dynamic> json) => new AddToCart(
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
    DataCart data;
    Navigation navigation;

    Output({
        this.data,
        this.navigation,
    });

    factory Output.fromJson(Map<String, dynamic> json) => new Output(
        data: DataCart.fromJson(json["DATA"]),
        navigation: Navigation.fromJson(json["NAVIGATION"]),
    );

    Map<String, dynamic> toJson() => {
        "DATA": data.toJson(),
        "NAVIGATION": navigation.toJson(),
    };
}

class DataCart {
    List<BasketElement> basket;

    DataCart({
        this.basket,
    });

    factory DataCart.fromJson(Map<String, dynamic> json) => new DataCart(
        basket: new List<BasketElement>.from(json["BASKET"].map((x) => BasketElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "BASKET": new List<dynamic>.from(basket.map((x) => x.toJson())),
    };
}

class BasketElement {
    List<Item> items;

    BasketElement({
        this.items,
    });

    factory BasketElement.fromJson(Map<String, dynamic> json) => new BasketElement(
        items: new List<Item>.from(json["ITEMS"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ITEMS": new List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class Item {
    ItemBasket basket;
    Prices prices;
    Quantity quantity;
    ImageCart image;

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
        image: ImageCart.fromJson(json["IMAGE"]),
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
        fulfilled: json["FULFILLED"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "PRODUCT_ID": productId,
        "NAME": name,
        "FULFILLED": fulfilled,
    };
}

class ImageCart {
    String thumb;

    ImageCart({
        this.thumb,
    });

    factory ImageCart.fromJson(Map<String, dynamic> json) => new ImageCart(
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

class Navigation {
    Navigation();

    factory Navigation.fromJson(Map<String, dynamic> json) => new Navigation(
    );

    Map<String, dynamic> toJson() => {
    };
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
