import 'package:flutter/material.dart';

abstract class BasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildScafold(),
    );
  }

  Widget buildScafold() {
    return Scaffold(
      appBar: getAppBar(),
      body: buildContent() == null ?  defaultBody() : buildContent(),
    );
  }

  Widget buildContent();

  Widget defaultBody() {
    return Center(
      child: Padding(
        child: Text('Default Content'),
        padding: EdgeInsets.all(10),
      ),
    );
  }

  Widget getAppBar() {
    return AppBar(title: Text('Awok'),);
  }
}
