import 'dart:convert';

Delivery deliveryFromJson(String str) {
    final jsonData = json.decode(str);
    return Delivery.fromJson(jsonData);
}

String deliveryToJson(Delivery data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class Delivery {
    Api api;
    Status status;
    Output output;

    Delivery({
        this.api,
        this.status,
        this.output,
    });

    factory Delivery.fromJson(Map<String, dynamic> json) => new Delivery(
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
    List<Info> data;
    Navigation navigation;

    Output({
        this.data,
        this.navigation,
    });

    factory Output.fromJson(Map<String, dynamic> json) => new Output(
        data: new List<Info>.from(json["DATA"].map((x) => Info.fromJson(x))),
        navigation: Navigation.fromJson(json["NAVIGATION"]),
    );

    Map<String, dynamic> toJson() => {
        "DATA": new List<dynamic>.from(data.map((x) => x.toJson())),
        "NAVIGATION": navigation.toJson(),
    };
}

class Info {
    String id;
    String name;
    String additionalData;
    String logo;
    Rate rate;

    Info({
        this.id,
        this.name,
        this.additionalData,
        this.logo,
        this.rate,
    });

    factory Info.fromJson(Map<String, dynamic> json) => new Info(
        id: json["ID"],
        name: json["NAME"],
        additionalData: json["ADDITIONAL_DATA"],
        logo: json["LOGO"],
        rate: Rate.fromJson(json["RATE"]),
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "NAME": name,
        "ADDITIONAL_DATA": additionalData,
        "LOGO": logo,
        "RATE": rate.toJson(),
    };
}

class Rate {
    int price;
    String currency;

    Rate({
        this.price,
        this.currency,
    });

    factory Rate.fromJson(Map<String, dynamic> json) => new Rate(
        price: json["PRICE"],
        currency: json["CURRENCY"],
    );

    Map<String, dynamic> toJson() => {
        "PRICE": price,
        "CURRENCY": currency,
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