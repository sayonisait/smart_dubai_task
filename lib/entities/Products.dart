import 'dart:convert';

Products productsFromJson(String str) {
    final jsonData = json.decode(str);
    return Products.fromJson(jsonData);
}

String productsToJson(Products data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class Products {
    Status status;
    Output output;
    Api api;

    Products({
        this.status,
        this.output,
        this.api,
    });

    factory Products.fromJson(Map<String, dynamic> json) => new Products(
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
    HomeData data;
    Navigation navigation;

    Output({
        this.data,
        this.navigation,
    });

    factory Output.fromJson(Map<String, dynamic> json) => new Output(
        data: HomeData.fromJson(json["DATA"]),
        navigation: Navigation.fromJson(json["NAVIGATION"]),
    );

    Map<String, dynamic> toJson() => {
        "DATA": data.toJson(),
        "NAVIGATION": navigation.toJson(),
    };
}

class HomeData {
    List<Item> items;
    String title;
    String domain;
    Banner banner;

    HomeData({
        this.items,
        this.title,
        this.domain,
        this.banner,
    });

    factory HomeData.fromJson(Map<String, dynamic> json) => new HomeData(
        items: new List<Item>.from(json["ITEMS"].map((x) => Item.fromJson(x))),
        title: json["TITLE"],
        domain: json["DOMAIN"],
        banner: Banner.fromJson(json["BANNER"]),
    );

    Map<String, dynamic> toJson() => {
        "ITEMS": new List<dynamic>.from(items.map((x) => x.toJson())),
        "TITLE": title,
        "DOMAIN": domain,
        "BANNER": banner.toJson(),
    };
}

class Banner {
    int height;
    int width;
    String type;
    String url;

    Banner({
        this.height,
        this.width,
        this.type,
        this.url,
    });

    factory Banner.fromJson(Map<String, dynamic> json) => new Banner(
        height: json["HEIGHT"],
        width: json["WIDTH"],
        type: json["TYPE"],
        url: json["URL"],
    );

    Map<String, dynamic> toJson() => {
        "HEIGHT": height,
        "WIDTH": width,
        "TYPE": type,
        "URL": url,
    };
}

class Item {
    String id;
    String linkedProdId;
    String linkedProdCode;
    String linkedSectionCode;
    String name;
    String sort;
    String imageFile;
    String activeFrom;
    String activeFromFormatted;
    String activeTo;
    String dateDifference;
    Ild preOrder;
    ImageSource image;
    Prices prices;
    CartData cartData;
    String productLink;
    Cart cart;
    String videoId;

    Item({
        this.id,
        this.linkedProdId,
        this.linkedProdCode,
        this.linkedSectionCode,
        this.name,
        this.sort,
        this.imageFile,
        this.activeFrom,
        this.activeFromFormatted,
        this.activeTo,
        this.dateDifference,
        this.preOrder,
        this.image,
        this.prices,
        this.cartData,
        this.productLink,
        this.cart,
        this.videoId,
    });

    factory Item.fromJson(Map<String, dynamic> json) => new Item(
        id: json["ID"],
        linkedProdId: json["LINKED_PROD_ID"],
        linkedProdCode: json["LINKED_PROD_CODE"],
        linkedSectionCode: json["LINKED_SECTION_CODE"],
        name: json["NAME"],
        sort: json["SORT"],
        imageFile: json["IMAGE_FILE"],
        activeFrom: json["ACTIVE_FROM"],
        activeFromFormatted: json["ACTIVE_FROM_FORMATTED"],
        activeTo: json["ACTIVE_TO"],
        dateDifference: json["DATE_DIFFERENCE"],
        preOrder: ildValues.map[json["PRE_ORDER"]],
        image: ImageSource.fromJson(json["IMAGE"]),
        prices: Prices.fromJson(json["PRICES"]),
        cartData: CartData.fromJson(json["CART_DATA"]),
        productLink: json["PRODUCT_LINK"],
        cart: Cart.fromJson(json["CART"]),
        videoId: json["VIDEO_ID"] == null ? null : json["VIDEO_ID"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "LINKED_PROD_ID": linkedProdId,
        "LINKED_PROD_CODE": linkedProdCode,
        "LINKED_SECTION_CODE": linkedSectionCode,
        "NAME": name,
        "SORT": sort,
        "IMAGE_FILE": imageFile,
        "ACTIVE_FROM": activeFrom,
        "ACTIVE_FROM_FORMATTED": activeFromFormatted,
        "ACTIVE_TO": activeTo,
        "DATE_DIFFERENCE": dateDifference,
        "PRE_ORDER": ildValues.reverse[preOrder],
        "IMAGE": image.toJson(),
        "PRICES": prices.toJson(),
        "CART_DATA": cartData.toJson(),
        "PRODUCT_LINK": productLink,
        "CART": cart.toJson(),
        "VIDEO_ID": videoId == null ? null : videoId,
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

 enum TitleKey { ADD_TO_CART }

// final titleValues = new EnumValues({
//     "ADD TO CART": TitleKey.ADD_TO_CART
// });

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

enum Ild { N }

final ildValues = new EnumValues({
    "N": Ild.N
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
