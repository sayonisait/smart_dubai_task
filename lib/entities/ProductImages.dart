// To parse this JSON data, do
//
//     final productImages = productImagesFromJson(jsonString);

import 'dart:convert';

ProductImages productImagesFromJson(String str) {
  final jsonData = json.decode(str);
  return ProductImages.fromJson(jsonData);
}

String productImagesToJson(ProductImages data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class ProductImages {
  Api api;
  Status status;
  Output output;

  ProductImages({
    this.api,
    this.status,
    this.output,
  });

  factory ProductImages.fromJson(Map<String, dynamic> json) {
    Status status = Status.fromJson(json["STATUS"]);

    return new ProductImages(
      api: Api.fromJson(json["API"]),
      status: status,
      output: status.code == 200 ? Output.fromJson(json["OUTPUT"]) : null,
    );
  }

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
  String custom;
  String large;
  String original;

  Datum({this.custom, this.large, this.original});

  factory Datum.fromJson(Map<String, dynamic> json) => new Datum(
        custom: json["custom"],
        original: json["original"],
        large: json["large"],
      );

  Map<String, dynamic> toJson() =>
      {"custom": custom, "original": original, "large": large};
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
