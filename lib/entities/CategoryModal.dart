// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Category categoryFromJson(String str) {
    final jsonData = json.decode(str);
    return Category.fromJson(jsonData);
}

String categoryToJson(Category data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class Category {
    Api api;
    Status status;
    Output output;

    Category({
        this.api,
        this.status,
        this.output,
    });

    factory Category.fromJson(Map<String, dynamic> json) => new Category(
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
    List<Datum> data;
    Navigation navigation;

    Output({
        this.data,
        this.navigation,
    });

    factory Output.fromJson(Map<String, dynamic> json) => new Output(
        data: new List<Datum>.from(json["DATA"].map((x) => Datum.fromJson(x))),
        navigation: Navigation.fromJson(json["NAVIGATION"]),
    );

    Map<String, dynamic> toJson() => {
        "DATA": new List<dynamic>.from(data.map((x) => x.toJson())),
        "NAVIGATION": navigation.toJson(),
    };
}

class Datum {
    String value;
    String titleEn;
    String titleAr;
    String depthLevel;
    String parentId;
    Key key;
    List<Datum> children;
    Image image;

    Datum({
        this.value,
        this.titleEn,
        this.titleAr,
        this.depthLevel,
        this.parentId,
        this.key,
        this.children,
        this.image,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => new Datum(
        value: json["VALUE"],
        titleEn: json["TITLE_EN"],
        titleAr: json["TITLE_AR"],
        depthLevel: json["DEPTH_LEVEL"],
        parentId: json["PARENT_ID"],
        key: keyValues.map[json["KEY"]],
        children: new List<Datum>.from(json["CHILDREN"].map((x) => Datum.fromJson(x))),
        image: json["IMAGE"] == null ? null : Image.fromJson(json["IMAGE"]),
    );

    Map<String, dynamic> toJson() => {
        "VALUE": value,
        "TITLE_EN": titleEn,
        "TITLE_AR": titleAr,
        "DEPTH_LEVEL": depthLevel,
        "PARENT_ID": parentId,
        "KEY": keyValues.reverse[key],
        "CHILDREN": new List<dynamic>.from(children.map((x) => x.toJson())),
        "IMAGE": image == null ? null : image.toJson(),
    };
}

class Image {
    String thumb;

    Image({
        this.thumb,
    });

    factory Image.fromJson(Map<String, dynamic> json) => new Image(
        thumb: json["thumb"],
    );

    Map<String, dynamic> toJson() => {
        "thumb": thumb,
    };
}

enum Key { CATEGORY_ID }

final keyValues = new EnumValues({
    "category_id": Key.CATEGORY_ID
});

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
