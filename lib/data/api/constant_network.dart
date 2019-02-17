

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
  static const String home = "/home/?";
  static const String product = "/v2/products/";
  static const String productVariants = "/v2/products/variants";
  
  static const String flash = "/flash/";
  static const String cart = "/v2/cart/";
  static const String yyyy = "/v2/cart/?param1=valu1&param2=valu2";
//offer
  static const String offer = "/v2/offers/";
  //Category
   static const String category = "/v2/categories/";

}

//APi Headers
class Headers {
  static const String authorization = "Authorization";
}

//Products Apis
class APIs {
  String get apiHome => _getEndPointURL(Country.AE) + ApiResources.home;
  String get apiFlash => _getEndPointURL(Country.AE) + ApiResources.flash;
  String get apiCart => _getEndPointURL(Country.AE) + ApiResources.cart;
  String  apiProductDetail(String productId) => _getEndPointURL(Country.AE) + ApiResources.product+productId;
  String  apiHomeWithPage(String page) => _getEndPointURL(Country.AE) + ApiResources.home+page;
  String get addToCart => _getEndPointURL(Country.AE) + ApiResources.cart;
  String get apiOffer => _getEndPointURL(Country.AE) + ApiResources.offer;
  String get apiCategory => _getEndPointURL(Country.AE) + ApiResources.category;
  

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
