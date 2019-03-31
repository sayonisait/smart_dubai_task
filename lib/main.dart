
import 'package:awok_starter/bloc/HomePageOldBloc.dart';
import 'package:awok_starter/bloc/NativeBlockProvider.dart';
import 'package:awok_starter/di/DependencyInjection.dart';
import 'package:flutter/material.dart';
import 'package:awok_starter/ui/pages/HomePageOld.dart';

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
        primarySwatch: Colors.blue,
        accentColor: Colors.blueAccent,
        canvasColor:Colors.transparent.withAlpha(5),
      ),
      home: BlocProvider<HomePageOldBloc>(
        bloc: HomePageOldBloc(),
        child: HomePageRoute(),
      ),
    );
  }
}
