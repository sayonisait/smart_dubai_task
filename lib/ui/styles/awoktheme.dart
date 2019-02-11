import 'package:awok_starter/ui/styles/colors.dart';
import 'package:flutter/material.dart';


//Widgets Styles 
TextStyle textStyle = const TextStyle(
    color: clrWhite, fontSize:40.0, fontWeight: FontWeight.bold);


ThemeData awokTheme = new ThemeData(
  //hintColor: clrBlack,
  //accentColor: clrBlue,
  //accentColor: clrOrangeDeep,
  primarySwatch: clrBlue,
  scaffoldBackgroundColor: Colors.white,
  // Define the default Font Family
  fontFamily: 'Montserrat',
  primaryTextTheme: Typography(platform: TargetPlatform.android).black,
  textTheme: TextTheme(
      headline: TextStyle(color: clrlack, fontSize: 72.0, fontWeight: FontWeight.bold),
      title: TextStyle(color: clrlack,fontSize: 36.0, fontStyle: FontStyle.italic),
      body1: TextStyle(color: clrlack,fontSize: 14.0, fontFamily: 'Hind'),
    ),
);