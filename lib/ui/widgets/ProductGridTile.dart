

import 'package:flutter/material.dart';

class ProductGridTile extends StatelessWidget {
  String value;
  ProductGridTile(this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: makeTile(this.value),
    );
  }
}


Widget makeTile(String value) {
    return GridTile(
      child: Text(value),
      footer: Text('Footer'),
      header: Text('header'),
    );
  }