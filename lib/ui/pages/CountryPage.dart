import 'package:awok_starter/ui/pages/BaseStatelessPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CountryPage extends BaseStatelessPage {
  @override
  Widget buildContent() {
    return Center(
        child: RaisedButton(
      child: Text("Go To Product Details"),
      onPressed: () {},
    ));
  }
}
