// To parse this JSON data, do
//
//     final productDetail = productDetailFromJson(jsonString);

import 'dart:convert';

import 'package:awok_starter/entities/Tag.dart';

Product productDetailFromJson(String str) {
    final jsonData = json.decode(str);
    return Product.fromJson(jsonData);
}

String productDetailToJson(Product data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class Product {

    Api api;
    Status status;
    Output output;

    Product({
        this.api,
        this.status,
        this.output,
    });

    factory Product.fromJson(Map<String, dynamic> json) {
            Status status = Status.fromJson(json["STATUS"]);

      
      return new Product(
        api: Api.fromJson(json["API"]),
        status: status,
      output: status.code == 200 ? Output.fromJson(json["OUTPUT"]) : null,
    );}

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
    ProductData data;
    Navigation navigation;

    Output({
        this.data,
        this.navigation,
    });

    factory Output.fromJson(Map<String, dynamic> json) => new Output(
        data: ProductData.fromJson(json["DATA"]),
        navigation: Navigation.fromJson(json["NAVIGATION"]),
    );

    Map<String, dynamic> toJson() => {
        "DATA": data.toJson(),
        "NAVIGATION": navigation.toJson(),
    };
}

class ProductData {
  
    String id;
    String name;
    Store store;
    Prices prices;
    Tag warranty;
    Tag condition;
    List<Tag> tags;
    List<Variant> variants;
    Tag share;
    Tag cart;
    List<Tag> attributes;

    ProductData({
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

    factory ProductData.fromJson(Map<String, dynamic> json) => new ProductData(
        id: json["ID"],
        name: json["NAME"],
        store:json.keys.contains("STORE")?  Store.fromJson(json["STORE"]):null,
        prices: json.keys.contains("PRICES")? Prices.fromJson(json["PRICES"]):null,
        warranty:json.keys.contains("WARRANTY")? Tag.fromJson(json["WARRANTY"]):null,
        condition:json.keys.contains("CONDITION")? Tag.fromJson(json["CONDITION"]):null,
        tags:json.keys.contains("TAGS")? new List<Tag>.from(json["TAGS"].map((x) => Tag.fromJson(x))):null,
        variants: json.keys.contains("VARIANTS")? new List<Variant>.from(json["VARIANTS"].map((x) => Variant.fromJson(x))):null,
        share:json.keys.contains("SHARE")?  Tag.fromJson(json["SHARE"]):null,
        cart:json.keys.contains("CART")?  Tag.fromJson(json["CART"]):null,
        attributes:json.keys.contains("ATTRIBUTES")?  new List<Tag>.from(json["ATTRIBUTES"].map((x) => Tag.fromJson(x))):null,
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "NAME": name,
        "STORE": store.toJson(),
        "PRICES": prices.toJson(),
        "WARRANTY": warranty.toJson(),
        "CONDITION": condition.toJson(),
        "TAGS":  new List<dynamic>.from(tags.map((x) => x.toJson())),
        "VARIANTS": new List<dynamic>.from(variants.map((x) => x.toJson())),
        "SHARE": share.toJson(),
        "CART": cart.toJson(),
        "ATTRIBUTES": new List<dynamic>.from(attributes.map((x) => x.toJson())),
    };
}



class Prices {
    String current;
    String msrp;
    String currency;

    Prices({
        this.current,
        this.msrp,
        this.currency,
    });

    factory Prices.fromJson(Map<String, dynamic> json) => new Prices(
        current:json["CURRENT"].toString(),
        msrp:  json["MSRP"].toString(),
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
    List<VariantItem> items;

    Variant({
        this.title,
        this.items,
    });

    factory Variant.fromJson(Map<String, dynamic> json) => new Variant(
        title: json["TITLE"],
        items: new List<VariantItem>.from(json["ITEMS"].map((x) => VariantItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "TITLE": title,
        "ITEMS": new List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class VariantItem {
    String productId;
    String title;

    VariantItem({
        this.productId,
        this.title,
    });

    factory VariantItem.fromJson(Map<String, dynamic> json) => new VariantItem(
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
