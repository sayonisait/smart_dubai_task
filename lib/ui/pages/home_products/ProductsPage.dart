import 'package:awok_starter/ui/components/flip_card.dart';
import 'package:awok_starter/ui/pages/BaseStatelessPage.dart';
import 'package:awok_starter/ui/pages/models/CategoryModel.dart';
import 'package:awok_starter/ui/pages/models/ProductModel.dart';
import 'package:awok_starter/ui/ui_constants.dart';
import 'package:awok_starter/ui/widgets/ListWidget.dart';
import 'package:awok_starter/ui/widgets/ProductGridTile.dart';
import 'package:awok_starter/ui/widgets/ProductListTile.dart';
import 'package:flutter/material.dart';

class ProductsPage extends BaseStatelessPage {
 
  String _title;
  ProductsPage(this._title);
  ListWidget _productPage,_categoryPage;
  List<ProductModel> _products = List<ProductModel>.generate(20, (i) => ProductModel.createProduct());
  List<CategoryModel> _category = List<CategoryModel>.generate(4, (i) => CategoryModel.createCategory());

  initProductList() {
    _productPage = ListWidget('_title',_products,ViewType.List);
    return _productPage;
  }

   initCategoryList() {
    // _categoryPage = ListWidget('_title',_category,ViewType.HorizontalList);
    // return _categoryPage;
  }

  @override
  Widget build(BuildContext context) {
    // return ListView(
    //   scrollDirection: Axis.vertical,
    //   children: <Widget>[
    //    initProductList(),
       
    //   ],
    // ) ;
    return  initProductList();
  }



}