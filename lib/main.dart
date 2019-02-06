
import 'package:awok_starter/bloc/HomeBloc.dart';
import 'package:awok_starter/bloc/NativeBlockProvider.dart';
import 'package:awok_starter/di/DependencyInjection.dart';
import 'package:awok_starter/ui/CounterWidget.dart';
import 'package:awok_starter/ui/pages/AccountPage.dart';
import 'package:awok_starter/ui/pages/HomePage.dart';
import 'package:awok_starter/ui/pages/TestPage.dart';
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
        primarySwatch: Colors.amber,
      ),
      home: BlocProvider<HomeBloc>(
        bloc: HomeBloc(),
        child: HomePage(),
      ),
    );
  }
}
