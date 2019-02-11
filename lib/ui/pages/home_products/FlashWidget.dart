import 'package:awok_starter/ui/components/flip_card.dart';
import 'package:awok_starter/ui/pages/BaseStatelessPage.dart';
import 'package:awok_starter/ui/pages/models/CategoryModel.dart';
import 'package:awok_starter/ui/pages/models/ProductModel.dart';
import 'package:awok_starter/ui/ui_constants.dart';
import 'package:awok_starter/ui/widgets/ListWidget.dart';
import 'package:awok_starter/ui/widgets/ProductGridTile.dart';
import 'package:awok_starter/ui/widgets/ProductListTile.dart';
import 'package:flutter/material.dart';

class FlashWidget extends BaseStatelessPage {
 
  String _title;
  FlashWidget(this._title);
  ListWidget _page;
  List<CategoryModel> _items =
  List<CategoryModel>.generate(20, (i) => CategoryModel.createCategory());

  initList() {
    // _page = ListWidget('_title',_items,ViewType.List);
    // return _page;
  }

  @override
  Widget build(BuildContext context) {
    return initList();
  }



}