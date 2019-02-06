import 'package:flutter/material.dart';

abstract class BaseStatelessPage extends StatelessWidget {
  String _title; 

  @override
  Widget build(BuildContext context) {
    return  _defaultBody(context);
  }


  //Widget buildContent(BuildContext context,{String title});

  Widget _defaultBody(BuildContext context) {
   return Center(
      child: Padding(
        child: Text('Default Content'),
        padding: EdgeInsets.all(10),
      ),
    );
  }
}