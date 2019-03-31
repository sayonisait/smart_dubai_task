// To parse this JSON data, do
//
//     final flashProducts = flashProductsFromJson(jsonString);

import 'dart:convert';

import 'package:awok_starter/entities/Item.dart';

FlashProducts flashProductsFromJson(String str) {
    final jsonData = json.decode(str);
    return FlashProducts.fromJson(jsonData);
}

String flashProductsToJson(FlashProducts data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class FlashProducts {
    Status status;
    Output output;
    Api api;

    FlashProducts({
        this.status,
        this.output,
        this.api,
    });

    factory FlashProducts.fromJson(Map<String, dynamic> json) => new FlashProducts(
        status: Status.fromJson(json["STATUS"]),
        output: Output.fromJson(json["OUTPUT"]),
        api: Api.fromJson(json["API"]),
    );

    Map<String, dynamic> toJson() => {
        "STATUS": status.toJson(),
        "OUTPUT": output.toJson(),
        "API": api.toJson(),
    };
}

class Api {
    int minAppVer;
    int minAppVersion;
    double version;
    String format;
    String lang;
    String currency;
    String currencySym;
    Uri uri;

    Api({
        this.minAppVer,
        this.minAppVersion,
        this.version,
        this.format,
        this.lang,
        this.currency,
        this.currencySym,
        this.uri,
    });

    factory Api.fromJson(Map<String, dynamic> json) => new Api(
        minAppVer: json["MIN_APP_VER"],
        minAppVersion: json["MIN_APP_VERSION"],
        version: json["VERSION"].toDouble(),
        format: json["FORMAT"],
        lang: json["LANG"],
        currency: json["CURRENCY"],
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
    FlashData data;
    Navigation navigation;

    Output({
        this.data,
        this.navigation,
    });

    factory Output.fromJson(Map<String, dynamic> json) => new Output(
        data: FlashData.fromJson(json["DATA"]),
        navigation: Navigation.fromJson(json["NAVIGATION"]),
    );

    Map<String, dynamic> toJson() => {
        "DATA": data.toJson(),
        "NAVIGATION": navigation.toJson(),
    };
}

class FlashData {
    List<Item> items;
    String title;

    FlashData({
        this.items,
        this.title,
    });

    factory FlashData.fromJson(Map<String, dynamic> json) => new FlashData(
        items: new List<Item>.from(json["ITEMS"].map((x) => Item.fromJson(x))),
        title: json["TITLE"],
    );

    Map<String, dynamic> toJson() => {
        "ITEMS": new List<dynamic>.from(items.map((x) => x.toJson())),
        "TITLE": title,
    };
}



class Cart {
    Title title;
    String value;

    Cart({
        this.title,
        this.value,
    });

    factory Cart.fromJson(Map<String, dynamic> json) => new Cart(
        title: titleValues.map[json["TITLE"]],
        value: json["VALUE"],
    );

    Map<String, dynamic> toJson() => {
        "TITLE": titleValues.reverse[title],
        "VALUE": value,
    };
}

enum Title { EMPTY, TITLE, PURPLE }

final titleValues = new EnumValues({
    "اضافة للعربة": Title.EMPTY,
    "منتهي الصلاحية": Title.PURPLE,
    "قادم": Title.TITLE
});

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

class ImageSource {
    String src;

    ImageSource({
        this.src,
    });

    factory ImageSource.fromJson(Map<String, dynamic> json) => new ImageSource(
        src: json["SRC"],
    );

    Map<String, dynamic> toJson() => {
        "SRC": src,
    };
}

enum LinkedSectionCode { MOBILE_PHONES, CAR_MOUNTS_HOLDERS, TABLET_PCS, LAPTOPS_NOTEBOOKS, TELEVISIONS, SMART_WATCHES_AND_WEARABLES }

final linkedSectionCodeValues = new EnumValues({
    "car-mounts-holders": LinkedSectionCode.CAR_MOUNTS_HOLDERS,
    "Laptops-Notebooks": LinkedSectionCode.LAPTOPS_NOTEBOOKS,
    "mobile-phones": LinkedSectionCode.MOBILE_PHONES,
    "smart-watches-and-wearables": LinkedSectionCode.SMART_WATCHES_AND_WEARABLES,
    "tablet-pcs": LinkedSectionCode.TABLET_PCS,
    "televisions": LinkedSectionCode.TELEVISIONS
});

enum PreOrder { N, Y }

final preOrderValues = new EnumValues({
    "N": PreOrder.N,
    "Y": PreOrder.Y
});

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
        priceNew: json["PRICE_NEW"],
        priceOld: json["PRICE_OLD"],
        discount: json["DISCOUNT"],
        percent: json["PERCENT"],
    );

    Map<String, dynamic> toJson() => {
        "PRICE_NEW": priceNew,
        "PRICE_OLD": priceOld,
        "DISCOUNT": discount,
        "PERCENT": percent,
    };
}

enum State { ACTIVE, UPCOMING, EXPIRED }

final stateValues = new EnumValues({
    "ACTIVE": State.ACTIVE,
    "EXPIRED": State.EXPIRED,
    "UPCOMING": State.UPCOMING
});

class Timer {
    String d;
    String h;
    String i;
    String s;

    Timer({
        this.d,
        this.h,
        this.i,
        this.s,
    });

    factory Timer.fromJson(Map<String, dynamic> json) => new Timer(
        d: json["D"],
        h: json["H"],
        i: json["I"],
        s: json["S"],
    );

    Map<String, dynamic> toJson() => {
        "D": d,
        "H": h,
        "I": i,
        "S": s,
    };
}

class Navigation {
    int total;
    int count;
    int page;
    int maxPages;

    Navigation({
        this.total,
        this.count,
        this.page,
        this.maxPages,
    });

    factory Navigation.fromJson(Map<String, dynamic> json) => new Navigation(
        total: json["TOTAL"],
        count: json["COUNT"],
        page: json["PAGE"],
        maxPages: json["MAX_PAGES"],
    );

    Map<String, dynamic> toJson() => {
        "TOTAL": total,
        "COUNT": count,
        "PAGE": page,
        "MAX_PAGES": maxPages,
    };
}

class Status {
    int code;
    String message;
    String key;
    int lcr;
    String srv;
    String msrv;

    Status({
        this.code,
        this.message,
        this.key,
        this.lcr,
        this.srv,
        this.msrv,
    });

    factory Status.fromJson(Map<String, dynamic> json) => new Status(
        code: json["CODE"],
        message: json["MESSAGE"],
        key: json["KEY"],
        lcr: json["LCR"],
        srv: json["SRV"],
        msrv: json["MSRV"],
    );

    Map<String, dynamic> toJson() => {
        "CODE": code,
        "MESSAGE": message,
        "KEY": key,
        "LCR": lcr,
        "SRV": srv,
        "MSRV": msrv,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
