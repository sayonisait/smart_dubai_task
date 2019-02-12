import 'package:awok_starter/ui/components/flip_card.dart';
import 'package:awok_starter/ui/models/BaseModel.dart';
import 'package:awok_starter/ui/models/CategoryModel.dart';
import 'package:awok_starter/ui/models/ProductModel.dart';
import 'package:awok_starter/ui/pages/BaseStatelessPage.dart';
import 'package:awok_starter/ui/ui_constants.dart';
import 'package:awok_starter/ui/widgets/ProductGridTile.dart';
import 'package:awok_starter/ui/widgets/ProductListTile.dart';
import 'package:flutter/material.dart';

class ListWidget extends BaseStatelessPage {
  String _title;
  ListWidget(this._title, this._itemsProduct, this._type);
  ViewType _type;
  StatelessWidget cardWidget;
  List<BaseModel> _items;
  List<ProductModel> _itemsProduct;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(child: buildContent(context)),
    );
  }

  Widget buildContent(BuildContext context) {
    switch (_type) {
      case ViewType.HorizontalList:
        buildHorizontal(context);
        break;
      case ViewType.List:
        _items = _items as List<ProductModel>;
        buildListView(context);
        break;
      case ViewType.Grid:
        buildListView(context);
        break;
    }
  }

  Widget getGridView(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Grid_Item_Count),
      shrinkWrap: true,
      itemCount: _items.length,
      itemBuilder: (c, index) {
        //return makeCard(_items[index]);
      },
    );
  }

  Widget buildListView(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: _itemsProduct.length,
      itemBuilder: (c, index) {
        return Dismissible(
          key: Key(_itemsProduct[index].key),
          onDismissed: (direction) {
            _itemsProduct.removeAt(index);
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('items deleted'),
            ));
          },
          background: Container(
            color: Colors.red,
          ),
          child: _makeProductCard(_itemsProduct[index]),
        );
        //return makeCard(items[index]);
      },
    );
  }

  Widget buildHorizontal(BuildContext context) {
    print("items:${_items.length}");
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _items.length,
      itemBuilder: (c, index) {
        CategoryModel cc = _items[index] as CategoryModel;
        return _makeCategoryCard(cc);
      },
    );
  }

  _makeCategoryCard(CategoryModel category) {
    print('card');
    return Card(
      elevation: 0.8,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
          child: Text('data')),
    );
  }

  _makeProductCard(ProductModel product) {
    return Card(
      elevation: 0.8,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
          child: ProductListTile(product)),
    );
  }
}

enum ViewType { List, Grid, HorizontalList }
