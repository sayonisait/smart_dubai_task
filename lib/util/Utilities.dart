import 'package:flutter/material.dart';


class  DisplayUtility{
static isLargeDevice(BuildContext context){
   MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return queryData.size.width>500;
}
}