// To parse this JSON data, do
//
//     final productDetail = productDetailFromJson(jsonString);

import 'dart:convert';

ProductDetail productDetailFromJson(String str) {
    final jsonData = json.decode(str);
    return ProductDetail.fromJson(jsonData);
}

String productDetailToJson(ProductDetail data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class ProductDetail {
    Api api;
    Status status;
    Output output;

    ProductDetail({
        this.api,
        this.status,
        this.output,
    });

    factory ProductDetail.fromJson(Map<String, dynamic> json) => new ProductDetail(
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
    String id;
    String name;
    Store store;
    Prices prices;
    Cart warranty;
    Cart condition;
    List<Cart> tags;
    List<Variant> variants;
    Cart share;
    Cart cart;
    List<Cart> attributes;

    Data({
        this.id,
        this.name,
        this.store,
        this.prices,
        this.warranty,
        this.condition,
        this.tags,
        this.variants,
        this.share,
        this.cart,
        this.attributes,
    });

    factory Data.fromJson(Map<String, dynamic> json) => new Data(
        id: json["ID"],
        name: json["NAME"],
        store: Store.fromJson(json["STORE"]),
        prices: Prices.fromJson(json["PRICES"]),
        warranty: Cart.fromJson(json["WARRANTY"]),
        condition: Cart.fromJson(json["CONDITION"]),
        tags: new List<Cart>.from(json["TAGS"].map((x) => Cart.fromJson(x))),
        variants: new List<Variant>.from(json["VARIANTS"].map((x) => Variant.fromJson(x))),
        share: Cart.fromJson(json["SHARE"]),
        cart: Cart.fromJson(json["CART"]),
        attributes: new List<Cart>.from(json["ATTRIBUTES"].map((x) => Cart.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "NAME": name,
        "STORE": store.toJson(),
        "PRICES": prices.toJson(),
        "WARRANTY": warranty.toJson(),
        "CONDITION": condition.toJson(),
        "TAGS": new List<dynamic>.from(tags.map((x) => x.toJson())),
        "VARIANTS": new List<dynamic>.from(variants.map((x) => x.toJson())),
        "SHARE": share.toJson(),
        "CART": cart.toJson(),
        "ATTRIBUTES": new List<dynamic>.from(attributes.map((x) => x.toJson())),
    };
}

class Cart {
    String title;
    String value;

    Cart({
        this.title,
        this.value,
    });

    factory Cart.fromJson(Map<String, dynamic> json) => new Cart(
        title: json["TITLE"],
        value: json["VALUE"] == null ? null : json["VALUE"],
    );

    Map<String, dynamic> toJson() => {
        "TITLE": title,
        "VALUE": value == null ? null : value,
    };
}

class Prices {
    int current;
    int msrp;
    String currency;

    Prices({
        this.current,
        this.msrp,
        this.currency,
    });

    factory Prices.fromJson(Map<String, dynamic> json) => new Prices(
        current: json["CURRENT"],
        msrp: json["MSRP"],
        currency: json["CURRENCY"],
    );

    Map<String, dynamic> toJson() => {
        "CURRENT": current,
        "MSRP": msrp,
        "CURRENCY": currency,
    };
}

class Store {
    String title;
    String value;
    String fulfilled;

    Store({
        this.title,
        this.value,
        this.fulfilled,
    });

    factory Store.fromJson(Map<String, dynamic> json) => new Store(
        title: json["TITLE"],
        value: json["VALUE"],
        fulfilled: json["FULFILLED"],
    );

    Map<String, dynamic> toJson() => {
        "TITLE": title,
        "VALUE": value,
        "FULFILLED": fulfilled,
    };
}

class Variant {
    String title;
    List<Item> items;

    Variant({
        this.title,
        this.items,
    });

    factory Variant.fromJson(Map<String, dynamic> json) => new Variant(
        title: json["TITLE"],
        items: new List<Item>.from(json["ITEMS"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "TITLE": title,
        "ITEMS": new List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class Item {
    String productId;
    String title;

    Item({
        this.productId,
        this.title,
    });

    factory Item.fromJson(Map<String, dynamic> json) => new Item(
        productId: json["PRODUCT_ID"],
        title: json["TITLE"],
    );

    Map<String, dynamic> toJson() => {
        "PRODUCT_ID": productId,
        "TITLE": title,
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
