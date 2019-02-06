import 'package:awok_starter/ui/pages/BaseStatelessPage.dart';
import 'package:flutter/material.dart';

class CartPage extends BaseStatelessPage {
  String _title;
  CartPage(this._title);

  @override
  Widget build(BuildContext context) {
    return Text(_title);
  }
}
