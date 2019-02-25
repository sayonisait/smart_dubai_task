
import 'package:awok_starter/bloc/NativeBlockProvider.dart';
import 'package:awok_starter/di/DependencyInjection.dart';
import 'package:awok_starter/bloc/ProductDetailsBloc.dart';
import 'package:awok_starter/ui/pages/ProductDetailsPage.dart';
import 'package:flutter/material.dart';

void main() {
    Injector.configure(Flavor.Network);
    runApp(AwokApp());
}

class AwokApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Awok - Flutter',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        accentColor: Colors.blueAccent
      ),
      home: BlocProvider<ProductDetaisBloc>(
        bloc: ProductDetaisBloc(),
        child: ProductDetailsPage("Product Details"),
      ),
    );
  }
}
