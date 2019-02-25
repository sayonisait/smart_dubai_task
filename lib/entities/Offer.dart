// To parse this JSON data, do
//
//     final offer = offerFromJson(jsonString);

import 'dart:convert';

Offer offerFromJson(String str) {
    final jsonData = json.decode(str);
    return Offer.fromJson(jsonData);
}

String offerToJson(Offer data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class Offer {
    Api api;
    Status status;
    Output output;

    Offer({
        this.api,
        this.status,
        this.output,
    });

    factory Offer.fromJson(Map<String, dynamic> json) => new Offer(
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
    List<OfferElement> offers;

    Data({
        this.offers,
    });

    factory Data.fromJson(Map<String, dynamic> json) => new Data(
        offers: new List<OfferElement>.from(json["OFFERS"].map((x) => OfferElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "OFFERS": new List<dynamic>.from(offers.map((x) => x.toJson())),
    };
}

class OfferElement {
    String title;
    String description;
    String key;
    String image;
    String value;

    OfferElement({
        this.title,
        this.description,
        this.key,
        this.image,
        this.value,
    });

    factory OfferElement.fromJson(Map<String, dynamic> json) => new OfferElement(
        title: json["TITLE"],
        description: json["DESCRIPTION"],
        key: json["KEY"],
        image: json["IMAGE"],
        value: json["VALUE"],
    );

    Map<String, dynamic> toJson() => {
        "TITLE": title,
        "DESCRIPTION": description,
        "KEY": key,
        "IMAGE": image,
        "VALUE": value,
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
