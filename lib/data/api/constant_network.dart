

const String TOKEN = "";
const String KEY = "";

//EndPoints
class EndPoints {
  static const String uae = "https://ae.awok.com/api";
  static const String ksa = "https://ksa.awok.com/api";
  static const String global = "https://global.awok.com/api";
}

//Api urls
class ApiResources {
  static const String home = "";
  static const String product = "";
  static const String flash = "";
  static const String cart = "/v2/cart/";
}

//APi Headers
class Headers {
  static const String authorization = "Authorization";
}

//Products Apis
class APIs {
  String get apiHome => _getEndPointURL(Country.AE) + ApiResources.home;
  String get apiCart => _getEndPointURL(Country.AE) + ApiResources.cart;

  String _getEndPointURL(Country country) {
    String uri;
    switch (country) {
      case Country.AE:
        uri = EndPoints.uae;
        break;
      case Country.KSA:
        uri = EndPoints.ksa;
        break;
      default:
        uri = EndPoints.global;
        break;
    }
    return uri;
  }
} //end of class

enum Country { AE, KSA, Global }

enum Environment { Dev, Live }
