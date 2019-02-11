import 'package:awok_starter/ui/models/ProductModel.dart';
import 'package:awok_starter/ui/pages/BaseStatelessPage.dart';
import 'package:awok_starter/ui/widgets/ListWidget.dart';
import 'package:flutter/material.dart';

class AccountPage extends BaseStatelessPage {
  /** Steps to generate List
   * 1. Create Instance of the ProductsPage
   * 2.Set Type
   * 3.Set data items. 
   * 4.Build
   */

  String _title;
  AccountPage(this._title);
  ListWidget _page;
  List<ProductModel> _items =
      List<ProductModel>.generate(40, (i) => ProductModel.createProduct());

  initList() {
    _page = ListWidget('_title',_items,ViewType.List);
    return _page;
  }

  @override
  Widget build(BuildContext context) {
    return initList();
  }
}
