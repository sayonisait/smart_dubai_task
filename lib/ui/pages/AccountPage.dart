import 'package:awok_starter/ui/pages/BaseStatelessPage.dart';
import 'package:flutter/material.dart';

class AccountPage extends BaseStatelessPage{
 
  String _title ; 
  AccountPage(this._title);

 @override
   Widget build(BuildContext context) {
      return Text(_title);
   }
  
}