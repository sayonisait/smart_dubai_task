import 'package:awok_starter/entities/ProductDetail.dart';
import 'package:awok_starter/ui/pages/BaseStatelessPage.dart';
import 'package:flutter/material.dart';
import 'package:awok_starter/bloc/ProductDetailsBloc.dart';

class ProductDetailsPage extends BaseStatelessPage {
  String _title;
  ProductDetailsPage(this._title);
  ProductDetaisBloc bloc = ProductDetaisBloc();
  Widget buildScafold() {
    return Scaffold(
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Stack(children: <Widget>[
      buildAppBar(),
      ListView(
        children: [
          getPictureSection(),
          getDetailSection(),
        ],
      ),
    ]);
  }

  Widget buildAppBar() {

   return  new Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBar(
      title: Text("Product Details"),
      backgroundColor: Colors.transparent,
    ));
  }

  Widget getDetailSection() {
    return StreamBuilder(
      stream: bloc.stream,
      initialData: null,
      builder: (BuildContext context, AsyncSnapshot<ProductDetail> snapshot) {
        if (snapshot.hasData)
          return SingleChildScrollView(
              child: Text(
            snapshot.data.output.data.name,
            style: TextStyle(fontSize: 16),
          ));
        return CircularProgressIndicator(
          strokeWidth: 100,
        );
      },
    );
  }

  Widget getPictureSection() {
    List<String> pics = [
      "https://s4c.awokcdn.com/static/images/products/iblock-e8b-e8bae98b4f024ca040afb0f0912c165a.jpg/default.jpg",
      "https://s5d.awokcdn.com/static/images/products/iblock-94d-94d3317a32c040c61bbca6e86c52e305.jpg/default.jpg",
      "https://s4c.awokcdn.com/static/images/products/iblock-cac-cac18f957a6eb8eed6553fcd87b508e5.jpg/default.jpg"
    ];
    return AspectRatio(
        child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          primary: false,
          itemBuilder: (context, index) {
            return Image.network(
              pics[index],
            );
          },
        ),
        aspectRatio: 1);
  }

  @override
  Widget build(BuildContext context) {
    return buildScafold();
  }
}

getImage(String url) {
  // if(url!=null && url.isNotEmpty )
  // return SizedBox(width: double.infinity,height: 200,child:Image.network(url));
  // else{
  // print("Url is "+url);

  return Icon(
    Icons.image,
    color: Colors.white,
  );
  //}
}
