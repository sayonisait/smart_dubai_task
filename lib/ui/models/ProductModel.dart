

import 'package:awok_starter/ui/models/BaseModel.dart';

class ProductModel extends BaseModel{
  String id ; 
  String name;
  String imageurl ; 
  Price prices ; 
  String addToCartText ;
  String addToCartValue ; 
  String sku ; 
  bool preOrder ; 
  
  ProductModel.createProduct(){
    this.id = "123" ; 
    this.name = "Product #" ; 
    this.imageurl = "" ; 
    this.prices = Price.empty() ; 
    this.addToCartText = "Add to Cart" ; 
    this.addToCartValue = "" ; 
    this.sku = "" ; 
    this.preOrder = false;
  }
}

class Price{
  double newPrice; 
  double oldPrice;
  double discount; 
  double percent;  

  Price.empty(){
    this.newPrice = 10 ;
    this.oldPrice = 30; 
    this.discount = 20; 
    this.percent = 15; 
  }
}