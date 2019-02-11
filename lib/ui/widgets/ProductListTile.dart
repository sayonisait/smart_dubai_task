

import 'package:awok_starter/ui/pages/models/ProductModel.dart';
import 'package:flutter/material.dart';

class ProductListTile extends StatelessWidget {
  ProductModel _model;
  ProductListTile(this._model);
   ProductListTile.empty();
 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: makeListTile(this._model),
    );
  }
}


Widget makeListTile(ProductModel product) {
    return ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.white24))),
          child: Icon(Icons.add_to_home_screen, color: Colors.white),
        ),
        title: Text(
          product.name,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),

        subtitle: Row(
          children: <Widget>[
            Icon(Icons.linear_scale, color: Colors.yellowAccent),
            Text(product.prices.newPrice.toString(), style: TextStyle(color: Colors.white))
          ],
        ),
        trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0));
  }