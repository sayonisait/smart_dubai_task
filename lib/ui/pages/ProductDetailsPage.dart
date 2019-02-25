import 'package:awok_starter/bloc/NativeBlockProvider.dart';
import 'package:awok_starter/entities/Product.dart';
import 'package:awok_starter/entities/ProductDetails.dart';
import 'package:awok_starter/entities/ProductImages.dart';
import 'package:awok_starter/ui/pages/BaseStatelessPage.dart';
import 'package:flutter/material.dart';
import 'package:awok_starter/bloc/ProductDetailsBloc.dart';
import 'package:page_indicator/page_indicator.dart';

class ProductDetailsPage extends BaseStatelessPage {
  String _title;
  ProductDetailsPage(this._title);
  ProductDetaisBloc _bloc;

  getAddToCartSection() {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(
        Icons.shopping_cart,
      ),
      foregroundColor: Colors.white,
    );
  }

  Widget buildScafold() {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: buildBody(),
      floatingActionButton: getAddToCartSection(),
    );
  }

  Widget buildBody() {
    return Stack(children: <Widget>[
      SingleChildScrollView(
        child: getDetailSection(),
      ),
      buildAppBar(),
    ]);
  }

  Widget buildAppBar() {
    return new Positioned(
        top: 0.0,
        left: 0.0,
        right: 0.0,
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ));
  }

  Widget getDetailSection() {
    return StreamBuilder(
      stream: _bloc.stream,
      initialData: null,
      builder: (BuildContext context, AsyncSnapshot<ProductDetails> snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        }

        if (snapshot.hasData) {
          print(
              snapshot.data.product == null ? "No product" : "Product exists");
          print(snapshot.data.images == null ? "No images" : "images exists");

          return getDetailBody(snapshot.data, context);
        }
        print("No data");
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  getDetailBody(ProductDetails details, BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 80),
        child: Column(
          children: <Widget>[
            getPictureSection(details.images, context),
            details.product != null && details.product.output != null
                ? getFirstCard(details.product.output.data)
                : Container(),
            details.product != null &&
                    details.product.output != null &&
                    details.product.output.data != null
                ? getSecondCard(details.product.output.data.attributes)
                : Container(),
          ],
        ));
  }

  getStoreInfoText(Store store) {
    return Row(children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text(store.title),
              margin: EdgeInsets.only(bottom: 5, top: 5),
            ),
            Text(
              store.value,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      Image.network(
        store.fulfilled,
        height: 50,
        width: 100,
      )
    ]);
  }

  getVariantSection(List<Variant> variants, String productID) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 10, top: 10),
            child: Text(variants[0].title)),
        getListOfVariants(variants[0].items, productID),
      ],
    );
  }

  Widget getListOfVariants(List<VariantItem> items, String productID) {
    List<Widget> widgets = List();
    items.forEach((item) => widgets.add(Container(
          child: Text(item.title),
          decoration: BoxDecoration(
              border: Border.all(
                  color: item.productId == productID
                      ? Colors.orange
                      : Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(3))),
          padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
          margin: EdgeInsets.only(right: 15),
        )));
    return Row(children: widgets);
  }

  getFirstCard(Data data) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        margin: EdgeInsets.all(5),
        child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(5),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                getNameText(data != null && data.name != null ? data.name : ""),
                data != null && data.name != null
                    ? getPriceSection(data.prices)
                    : Container(
                        height: 10,
                      ),
                data != null && data.tags != null
                    ? getTagSection(data.tags)
                    : new Container(height: 10),
                Divider(),
                data != null && data.store != null
                    ? getStoreInfoText(data.store)
                    : Container(
                        height: 10,
                      ),
                Divider(),
                data != null && data.variants != null
                    ? getVariantSection(data.variants, data.id)
                    : Container(height: 10),
              ],
            )));
  }

  getSecondCard(List<Tag> attributes) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        margin: EdgeInsets.all(5),
        child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                getSpecificationsHEader(),
                Divider(),
                getSpecificationsListView(attributes)
              ],
            )));
  }

  getSpecificationsHEader() {
    return Container(
        child: Text(
          'Specifications',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        margin: EdgeInsets.all(10));
  }

  getSpecificationsListView(List<Tag> attributes) {
    if (attributes != null && attributes.length > 0)
      return ListView.builder(
        padding: EdgeInsets.all(0),
        shrinkWrap: true,
        primary: false,
        itemCount: attributes != null ? attributes.length : 0,
        itemBuilder: (context, position) {
          return ListTile(
              dense: true,
              trailing: Text(attributes[position].value),
              leading: Text(
                attributes[position].title,
              ));
        },
      );
    return Container(
      height: 100,
    );
  }

  getPriceSection(Prices prices) {
    return Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            getCurrentPriceText(prices.current, prices.currency),
            getOldPriceText(prices.msrp, prices.currency),
            getDiscountPriceText(getDiscount(prices.current, prices.msrp)),
          ],
        ));
  }

  getCurrentPriceText(String currenrPrice, String currency) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Text(
        currenrPrice + " " + currency,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  getOldPriceText(String price, String currency) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Text(
        price + " " + currency,
        style: TextStyle(
          color: Colors.grey,
          decoration: TextDecoration.lineThrough,
        ),
      ),
    );
  }

  getDiscountPriceText(String discount) {
    return Text(
      discount,
      style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),
    );
  }

  getTagSection(List<Tag> tags) {
    List<Widget> widgets = List();
    tags.forEach((tag) => widgets.add(getTagText(tag)));
    return Container(
        margin: EdgeInsets.only(bottom: 10, top: 10),
        child: Row(
          children: widgets,
        ));
  }

  getTagText(Tag tag) {
    return Container(
        color: Colors.grey[300],
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(right: 10),
        child: Row(
          children: <Widget>[Text(tag.title)],
        ));
  }

  String getDiscount(String current, String original) {
    double oldPrice = double.parse(original);
    double newPrice = double.parse(current);
    return "(" +
        ((oldPrice - newPrice) / oldPrice * 100).round().toString() +
        " % OFF)";
  }

  getNameText(String name) {
    return Text(
      name,
      style: TextStyle(fontSize: 14),
    );
  }

  Widget getPictureSection(List<Datum> pics, BuildContext context) {
    print(pics.toString());
    return AspectRatio(
        child: PageIndicatorContainer(
          align: IndicatorAlign.bottom,
          length: pics.length,
          indicatorColor: Colors.white,
          indicatorSelectorColor: Theme.of(context).accentColor,
          size: 8,
          pageView: PageView(
            scrollDirection: Axis.horizontal,
            children: getImages(pics),
          ),
        ),
        aspectRatio: 1);
  }

  List<Widget> getImages(List<Datum> pics) {
    List<Image> images = new List();
    pics.forEach((pic) => images.add(Image.network(pic.large)));
    return images;
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ProductDetaisBloc>(context);

    return buildScafold();
  }
}
