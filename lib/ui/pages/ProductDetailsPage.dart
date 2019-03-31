import 'dart:async';

import 'package:awok_starter/bloc/NativeBlockProvider.dart';
import 'package:awok_starter/entities/Product.dart';
import 'package:awok_starter/entities/ProductDelivery.dart';
import 'package:awok_starter/entities/ProductDetails.dart';
import 'package:awok_starter/entities/ProductImages.dart';
import 'package:awok_starter/entities/Tag.dart';
import 'package:awok_starter/ui/pages/BaseStatelessPage.dart';
import 'package:awok_starter/ui/pages/ProductImagesGallery.dart';
import 'package:flutter/material.dart';
import 'package:awok_starter/bloc/ProductDetailsBloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:page_indicator/page_indicator.dart';

class ProductDetailsPage extends BaseStatelessPage {
  String _title;
  ProductDetailsPage(this._title);
  ProductDetaisBloc _bloc;

  getAddToCartSection(BuildContext context, ProductDetails productDetails) {
    AddedProduct added = new AddedProduct();
    added.addedStatus = AddedProduct.NOT_ADDED;
    return StreamBuilder(
      stream: _bloc.streamToCart,
      initialData: added,
      builder: (BuildContext context, AsyncSnapshot<AddedProduct> snapshot) {
        return Positioned(
          child: GestureDetector(
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight,
                    stops: [0.1, 0.5, 0.9],
                    colors: [
                      Colors.blue[600],
                      Colors.blue[500],
                      Colors.blue[400],
                    ],
                  ),
                ),
                child: Center(
                  child: getAddToCartText(
                      snapshot, productDetails.product.cart.title),
                ),
              ),
              onTap: () {
                _bloc.sinkUserEvent
                    .add(new AddToCartAction(productDetails.product.id));
              }),
          right: 0,
          bottom: 0,
          left: 0,
        );

       
      },
    );
  }

  getAddToCartText(AsyncSnapshot<AddedProduct> added, String initialText) {
    String text = initialText;
    if (added.hasData) {
      if (added.data.addedStatus == AddedProduct.ADDING)
        return SizedBox(
    child: 
        new CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation(Colors.white),
        strokeWidth: 2,
        ),
    height: 20.0,
    width: 20.0,);
      else if (added.data.addedStatus == AddedProduct.ADDED) text = "VIEW CART";
    }

    return Text(
      text,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Widget buildScafold(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Builder(builder: (context) {
         

          return getDetailSection();
        }));
  }

  Widget buildBody(BuildContext context, ProductDetails details) {
    return Stack(children: <Widget>[
      SingleChildScrollView(
        child: getDetailBody(details, context),
      ),
      buildAppBar(),
       getAddToCartSection(context, details),
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
        if (snapshot.hasData) return buildBody(context, snapshot.data);

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
            details.product != null
                ? getFirstCard(details.product, details.deliveryInfo, context)
                : Container(),
            details.product != null
                ? getSecondCard(details.product.attributes)
                : Container(),
          ],
        ));
  }

  getDeliveryInfo(List<Info> deliveryMethods) {
    if (deliveryMethods != null && deliveryMethods.length > 0)
      return Column(children: <Widget>[
        Divider(),
        Row(children: <Widget>[
          Icon(
            Icons.local_shipping,
            color: Colors.grey,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(deliveryMethods[0].name,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(deliveryMethods[0].additionalData))
                  ]),
            ),
          ),
          deliveryMethods[0].rate != null
              ? Text(
                  deliveryMethods[0].rate.price.toString() +
                      " " +
                      deliveryMethods[0].rate.currency.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              : Container()
        ])
      ]);
    else
      return Container();
  }

  getStoreInfoText(Store store) {
    return store == null
        ? Container()
        : Column(children: <Widget>[
            Divider(),
            Row(children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(store.title),
                      margin: EdgeInsets.only(bottom: 5),
                    ),
                    Text(
                      store.value,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              store.fulfilled != null
                  ? Image.network(
                      store.fulfilled,
                      height: 50,
                      width: 100,
                    )
                  : Container()
            ])
          ]);
  }

  getVariantSection(List<Variant> variants, String productID) {
    return variants == null
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Divider(),
              Container(
                  margin: EdgeInsets.only(bottom: 10, top: 10),
                  child: Text(variants[0].title)),
              getListOfVariants(variants[0].items, productID),
            ],
          );
  }

/*Show the list of variants*/
  Widget getListOfVariants(List<VariantItem> items, String productID) {
    List<Widget> widgets = List();
    items.forEach((item) => widgets.add(Container(
          child: OutlineButton(
            child: Text(item.title),
            onPressed: () {
              //updates the stream so that bloc will fetch details of the variant selected
              _bloc.sinkUserEvent.add(new ChangeVariantAction(item.productId));
            },
            borderSide: BorderSide(
                color:
                    item.productId == productID ? Colors.orange : Colors.grey),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(3)),
            ),
          ),
          margin: EdgeInsets.only(right: 15, bottom: 10),
        )));
    return Wrap(children: widgets);
  }

  getFirstCard(
      ProductData data, List<Info> deliveryMethods, BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        margin: EdgeInsets.all(5),
        child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(5),
            color: Colors.white,
            child: data != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      getNameText(data.name != null ? data.name : ""),
                      getPriceSection(data.prices),
                      getTagSection(data.tags, context),
                      getStoreInfoText(data.store),
                      getVariantSection(data.variants, data.id),
                      getDeliveryInfo(deliveryMethods),
                    ],
                  )
                : Container()));
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
          return Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      attributes[position].title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      attributes[position].value,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
              ));
        },
      );
    return Container(
      height: 100,
    );
  }

  getPriceSection(Prices prices) {
    prices.currency = prices.currency == null
        ? "AED"
        : prices.currency; //todo remove this later

    return prices == null
        ? Container()
        : Container(
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

  getTagSection(List<Tag> tags, BuildContext context) {
    if (tags == null) return Container();
    List<Widget> widgets = List();
    tags.forEach((tag) => widgets.add(getTagText(tag, context)));
    return Wrap(
      children: widgets,
    );
  }

  Widget getTagText(Tag tag, BuildContext context) {
    return Container(
        color: Colors.grey[300],
        height: 30,
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(right: 5, top: 5, bottom: 5),
        child: Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(right: 5), child: Text(tag.title)),
            getHelpIcon(tag.value, context)
          ],
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
        ));
  }

  Widget getHelpIcon(String message, BuildContext context) {
    return message != null
        ? GestureDetector(
            child: Icon(
              Icons.help_outline,
              color: Colors.grey,
              size: 20,
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Column(
                        children: [
                          Html(
                            data: message,
                          ),
                        ],
                        mainAxisSize: MainAxisSize.min,
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("OK"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  });
            })
        : Container();
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
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Container(
        child: PageIndicatorContainer(
          align: IndicatorAlign.bottom,
          length: pics.length,
          indicatorColor: Colors.white,
          indicatorSelectorColor: Theme.of(context).accentColor,
          size: 8,
          pageView: PageView(
            scrollDirection: Axis.horizontal,
            children: getImages(pics, context),
          ),
        ),
        height: queryData.size.width > 500 ? 500 : queryData.size.width);
  }

  List<Widget> getImages(List<Datum> pics, BuildContext context) {
    List<Widget> images = new List();

    for (var i = 0; i < pics.length; i++) {
      images.add(GestureDetector(
        child: FadeInImage.assetNetwork(
          placeholder: 'awokPlaceholder.png',
          image: pics[i].large != null ? pics[i].large : "",
        ),
        onTap: () {
          _goToGallery(context, pics, i);
        },
      ));
    }
    return images;
  }

  void _showBottomSheet(context, AddedProduct product) {
    PersistentBottomSheetController controller = showBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Stack(children: [
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [Colors.transparent, Colors.white],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(0.0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                )),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(left: 5, right: 5, bottom: 15),
              padding: EdgeInsets.only(right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    product.productImageURL,
                    width: 70,
                    height: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                  Container(
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            product.productName,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                product.productPrice,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 10),
                              ))
                        ],
                      )),
                  Icon(
                    Icons.shopping_cart,
                    color: Colors.grey,
                    size: 20,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.grey,
                    size: 20,
                  ),
                ],
              ),
              height: 60,
            ),
          ]);
        });
    Timer(Duration(seconds: 3), () {
      controller.close();
      controller = null;
    });
  }

  _goToGallery(BuildContext context, List<Datum> images, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ProductImagesGallery(images, index)),
    );
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ProductDetaisBloc>(context);

    return buildScafold(context);
  }
}
