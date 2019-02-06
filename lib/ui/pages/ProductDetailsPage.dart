import 'package:awok_starter/entities/ProductDetail.dart';
import 'package:awok_starter/ui/pages/BasePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:awok_starter/bloc/ProductDetailsBloc.dart';

class ProductDetailsPage extends BasePage {
  ProductDetaisBloc bloc;

  ProductDetailsPage() {
    bloc = ProductDetaisBloc();
  }

  @override
  Widget buildContent() {
    return StreamBuilder(
      stream: bloc.stream,
      initialData: null,
      builder: (BuildContext context, AsyncSnapshot<ProductDetail> snapshot) {
        if (snapshot.hasData)
          return Column(
            children: <Widget>[
              Image.network(snapshot.data.imageUrl, ),
              Text(snapshot.data.name)
            ],
          );
        return CircularProgressIndicator();
      },
    );
  }
}
