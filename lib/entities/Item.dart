// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'dart:convert';

import 'package:awok_starter/entities/Tag.dart';

Item itemFromJson(String str) {
    final jsonData = json.decode(str);
    return Item.fromJson(jsonData);
}

String itemToJson(Item data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class Item {
    String id;
    String linkedProdId;
    String linkedSectionCode;
    String name;
    String sort;
    String imageFile;
    String activeFrom;
    String activeTo;
    String preOrder;
    ImageData image;
    Prices prices;
    CartData cartData;
    String productLink;
    String state;
    String webSale;
    Tag cart;

    Item({
        this.id,
        this.linkedProdId,
        this.linkedSectionCode,
        this.name,
        this.sort,
        this.imageFile,
        this.activeFrom,
        this.activeTo,
        this.preOrder,
        this.image,
        this.prices,
        this.cartData,
        this.productLink,
        this.state,
        this.webSale,
        this.cart,
    });

    factory Item.fromJson(Map<String, dynamic> json) => new Item(
        id: json["ID"],
        linkedProdId: json["LINKED_PROD_ID"],
        linkedSectionCode: json["LINKED_SECTION_CODE"],
        name: json["NAME"],
        sort: json["SORT"],
        imageFile: json["IMAGE_FILE"],
        activeFrom: json["ACTIVE_FROM"],
        activeTo: json["ACTIVE_TO"],
        preOrder: json["PRE_ORDER"],
        image: ImageData.fromJson(json["IMAGE"]),
        prices: Prices.fromJson(json["PRICES"]),
        cartData: CartData.fromJson(json["CART_DATA"]),
        productLink: json["PRODUCT_LINK"],
        state: json["STATE"],
        webSale: json["WEB_SALE"],
        cart: Tag.fromJson(json["CART"]),
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "LINKED_PROD_ID": linkedProdId,
        "LINKED_SECTION_CODE": linkedSectionCode,
        "NAME": name,
        "SORT": sort,
        "IMAGE_FILE": imageFile,
        "ACTIVE_FROM": activeFrom,
        "ACTIVE_TO": activeTo,
        "PRE_ORDER": preOrder,
        "IMAGE": image.toJson(),
        "PRICES": prices.toJson(),
        "CART_DATA": cartData.toJson(),
        "PRODUCT_LINK": productLink,
        "STATE": state,
        "WEB_SALE": webSale,
        "CART": cart.toJson(),
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
        value: json["VALUE"],
    );

    Map<String, dynamic> toJson() => {
        "TITLE": title,
        "VALUE": value,
    };
}

class CartData {
    String sku;
    String uid;
    String ssid;

    CartData({
        this.sku,
        this.uid,
        this.ssid,
    });

    factory CartData.fromJson(Map<String, dynamic> json) => new CartData(
        sku: json["SKU"],
        uid: json["UID"],
        ssid: json["SSID"],
    );

    Map<String, dynamic> toJson() => {
        "SKU": sku,
        "UID": uid,
        "SSID": ssid,
    };
}

class ImageData {
    String src;

    ImageData({
        this.src,
    });

    factory ImageData.fromJson(Map<String, dynamic> json) => new ImageData(
        src: json["SRC"],
    );

    Map<String, dynamic> toJson() => {
        "SRC": src,
    };
}

class Prices {
    String priceNew;
    String priceOld;
    String discount;
    String percent;

    Prices({
        this.priceNew,
        this.priceOld,
        this.discount,
        this.percent,
    });

    factory Prices.fromJson(Map<String, dynamic> json) => new Prices(
        priceNew: json["PRICE_NEW"].toString(),
        priceOld: json["PRICE_OLD"].toString(),
        discount: json["DISCOUNT"].toString(),
        percent: json["PERCENT"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "PRICE_NEW": priceNew,
        "PRICE_OLD": priceOld,
        "DISCOUNT": discount,
        "PERCENT": percent,
    };
}
