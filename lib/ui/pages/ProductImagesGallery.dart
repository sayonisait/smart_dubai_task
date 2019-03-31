import 'package:awok_starter/entities/ProductImages.dart';
import 'package:awok_starter/ui/pages/BaseStatelessPage.dart';
import 'package:flutter/material.dart';
import 'package:awok_starter/util/Utilities.dart';

class ProductImagesGallery extends StatelessWidget {
  List<Datum> images;
  int initial;

  @override
  Widget build(BuildContext context) {
    return buildScaffold(context);
  }

  ProductImagesGallery(List<Datum> images, int position) {
    this.images = images;
    print(images);
    this.initial = position;
  }

  buildScaffold(BuildContext context) {
    return DefaultTabController(
      initialIndex: initial,
      length: images.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Gallery"),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(10),
          child: SizedBox(
            child: TabBar(
              tabs: getTabs(context),
              isScrollable: true,
            ),
          ),
        ),
        body: TabBarView(
          children: getImages(),
        ),
      ),
    );
  }

  getTabs(BuildContext context) {
    double size = DisplayUtility.isLargeDevice(context) ? 80 : 50;
    List<Widget> widgets = new List();
    images.forEach((item) {
     
        widgets.add(Container(
            height: size,
            width: size,
            child: Image.network(
              item.custom!=null?item.custom:"",
            )));
    });
    return widgets;
  }

  getImages() {
    List<Widget> widgets = new List();
    images.forEach((item) {
        widgets.add(
           
            Image.network(
          item.original!=null? item.original:"",
        ));
    });
    return widgets;
  }
}
