import 'package:awok_starter/entities/ProductDetail.dart';
import 'package:awok_starter/ui/pages/BaseStatelessPage.dart';
import 'package:flutter/material.dart';
import 'package:awok_starter/bloc/ProductDetailsBloc.dart';

class ProductDetailsPage extends BaseStatelessPage {
   ProductDetaisBloc bloc=ProductDetaisBloc();


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.stream,
      initialData: null,
      builder: (BuildContext context, AsyncSnapshot<ProductDetail> snapshot) {
        if (snapshot.hasData)
          return SingleChildScrollView(child: 
              getImage(snapshot.data.imageUrl),
             // Text(snapshot.data.name, style: TextStyle(fontSize: 12),)
                      );
        return CircularProgressIndicator();
      },
    );
  }
}

getImage(String url){
  // if(url!=null && url.isNotEmpty )
  // return SizedBox(width: double.infinity,height: 200,child:Image.network(url));
  // else{
  // print("Url is "+url);

    return Icon(Icons.image, color: Colors.white,);
  //}
}