import 'package:awok_starter/bloc/NativeBlockProvider.dart';
import 'package:awok_starter/bloc/NewHomeBloc.dart';
import 'package:awok_starter/entities/AddToCart.dart';
import 'package:awok_starter/entities/CategoryModal.dart';
import 'package:awok_starter/entities/FlashProducts.dart';
import 'package:awok_starter/entities/Offer.dart';
import 'package:awok_starter/entities/Products.dart';
import 'package:awok_starter/ui/pages/BaseStatelessPage.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Dashboard extends BaseStatelessPage {
  // NewHomeBloc bloc;
  // NewHomeBloc bloc = NewHomeBloc();
  @override
  Widget build(BuildContext context) {
    //bloc = BlocProvider.of<NewHomeBloc>(context);
    return getScaffold();
  }

  Widget getScaffold() {
    return Scaffold(
      // appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      title: Text('data'),
      backgroundColor: Colors.amber,
    );
  }

  Widget getBody() {
    return getContent();
  }

  Widget getContent() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            child: banner(),
          ),
          Container(
            child: getOfferProducts(),
          ),
          Container(
            child: getFlashProducts(),
          ),
          Container(
            child: flashProducts(),
          ),
          Container(
            child: getCategoryProducts(),
          ),
          Container(
            child: getProducts(),
          )
        ],
      ),
    );
  }

  Widget getProducts() {
    return StreamBuilder<Products>(
      stream: NewHomeBloc().myProducts,
      builder: (c, snapshoot) {
        if (snapshoot.hasData) {
          return getVerticalProducts(snapshoot.data.output.data);
          // getGridview(snapshoot.data.output.data, null);
        } else
          return Center(
            child: CircularProgressIndicator(),
          );
      },
    );
  }

  Widget getFlashProducts() {
    return StreamBuilder<FlashProducts>(
      stream: NewHomeBloc().myFlashProducts,
      builder: (c, snapshoot) {
        if (snapshoot.hasData) {
          return promotion(snapshoot.data.output.data);
          // getGridview(snapshoot.data.output.data, null);
        } else
          return Center(
            child: CircularProgressIndicator(),
          );
      },
    );
  }

  Widget getOfferProducts() {
    return StreamBuilder<Offer>(
      stream: NewHomeBloc().offerProducts,
      builder: (c, snapshoot) {
        if (snapshoot.hasData)
          return getOffer(snapshoot.data.output.data);
        //getGridview(null, snapshoot.data.output.data);
        else
          return Center(
            child: CircularProgressIndicator(),
          );
      },
    );
  }

  Widget addToCart() {
    return StreamBuilder<AddToCart>(
      stream: NewHomeBloc().addCart,
      builder: (c, snapshoot) {
        if (snapshoot.hasData) {
          return Text(snapshoot.data.status.message.toString());
          // getGridview(snapshoot.data.output.data, null);
        } else
          return Center(
            child: CircularProgressIndicator(),
          );
      },
    );
  }

  Widget getCategoryProducts() {
    return StreamBuilder<Category>(
      stream: NewHomeBloc().categoryProducts,
      builder: (c, snapshoot) {
        if (snapshoot.hasData)
          return categoryDisplay(snapshoot.data.output.data);
        //getGridview(null, snapshoot.data.output.data);
        else
          return Center(
            child: CircularProgressIndicator(),
          );
      },
    );
  }

  Widget banner() {
    return SizedBox(
        height: 250.0,
        width: 420.0,
        child: new Carousel(
          images: [
            new NetworkImage(
                'https://s4c.awokcdn.com/static/images/products/iblock-e8b-e8bae98b4f024ca040afb0f0912c165a.jpg/default.jpg'),
            new NetworkImage(
                'https://s5d.awokcdn.com/static/images/products/iblock-94d-94d3317a32c040c61bbca6e86c52e305.jpg/default.jpg'),
            new NetworkImage(
                'https://s4c.awokcdn.com/static/images/products/iblock-cac-cac18f957a6eb8eed6553fcd87b508e5.jpg/default.jpg'),
            new NetworkImage(
                'https://s4c.awokcdn.com/static/images/products/iblock-e8b-e8bae98b4f024ca040afb0f0912c165a.jpg/default.jpg'),
            new NetworkImage(
                'https://s4c.awokcdn.com/static/images/products/iblock-e8b-e8bae98b4f024ca040afb0f0912c165a.jpg/default.jpg'),
          ],
        ));
  }

  Widget getOffer(Data data) {
    print('my offer $data');
    return Container(
      height: 228.0,
      child: Card(
        elevation: 2.0,
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Offers',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16.0),
                  ),
                ],
              ),
            ),
            GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: data.offers.length,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 1.40),
              primary: false,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                //return Card(
                // elevation: 5.0,
                return Column(
                  children: <Widget>[
                    Container(
                      constraints: new BoxConstraints.expand(
                        height: 30.0,
                      ),
                      alignment: Alignment.center,
                      padding: new EdgeInsets.only(
                          left: 16.0, bottom: 0.0, top: 40.0),
                      decoration: new BoxDecoration(
                        //color: Colors.black,
                        image: new DecorationImage(
                          // colorFilter: new ColorFilter.mode(
                          //    Colors.black.withOpacity(0.65), BlendMode.dstIn),
                          image: NetworkImage(data.offers[index].image),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      child: new Text(data.offers[index].title,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.black)),
                    ),
                    
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget promotion(FlashData data) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
          child: Row(
            children: <Widget>[
              Text(
                'Weak Promotion',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 14.0),
              ),
            ],
          ),
        ),
        getHorizontalProducts(data),
      ],
    );
  }

  Widget flashProducts() {
    return Center(
      child: Container(
        height: 320.0,
        color: Colors.lightBlue,
        child: Center(
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 1.9,
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
            ),
            primary: false,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Center(
                    child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                        width: 80.0,
                        height: 80.0,
                        //alignment: AlignmentDirectional(0.0, 0.0),
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage(
                                    "https://s5d.awokcdn.com/static/images/products/iblock-94d-94d3317a32c040c61bbca6e86c52e305.jpg/default.jpg")))),
                    new Text(
                      "Flash \n Sale",
                      textScaleFactor: 1.5,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14.0),
                    )
                  ],
                ));
              }
              return Column(
                children: <Widget>[
                  FadeInImage.assetNetwork(
                    placeholder: 'images/awokPlaceholder.png',
                    image:
                        'https://s5d.awokcdn.com/static/images/products/iblock-94d-94d3317a32c040c61bbca6e86c52e305.jpg/default.jpg',

                    //result.output.data.items[index].image.src,
                  ),
                ],
              );
            },
          ),
        ),
        alignment: Alignment(0.0, 1.0),
      ),
    );
  }

  Widget categoryDisplay(List<Datum> data) {
    return Column(
      children: <Widget>[
        Container(
          height: 50.0,
          margin: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
          child: Row(
            children: <Widget>[
              Text(
                'Category',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 14.0),
              ),
            ],
          ),
        ),
        Container(
          height: 280.0,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 12,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
            primary: false,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 4.0,
                child: Column(
                  children: <Widget>[
                    Container(
                      constraints: new BoxConstraints.expand(
                        height: 130.0,
                      ),
                      alignment: Alignment.center,
                      padding: new EdgeInsets.only(left: 16.0, bottom: 8.0),
                      decoration: new BoxDecoration(
                        color: Colors.black,
                        image: new DecorationImage(
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(1.0), BlendMode.dstIn),
                          image: NetworkImage(data[index].image.thumb),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: new Text(data[index].titleEn,
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Colors.white)),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget getVerticalProducts(HomeData data) {
    return Column(
      children: <Widget>[
        Container(
          height: 30.0,
          child: Text(
            'Online Shopping Festival',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 14.0,
                fontStyle: FontStyle.normal,
                color: Colors.black),
          ),
        ),
        GridView.builder(
          //scrollDirection: Axis.horizontal,
          itemCount: data.items.length,

          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.65),
          primary: false,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 5.0,
              child: new Column(
                children: <Widget>[
                  FadeInImage.assetNetwork(
                    placeholder: 'images/awokPlaceholder.png',
                    image: data.items[index].image.src,
                    //result.output.data.items[index].image.src,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 5.0, right: 5.0, bottom: 5.0),
                    child: Text(
                      data.items[index].name,
                      maxLines: 2,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Text(data.items[index].prices.priceNew + 'AED'),
                      new Text(
                        data.items[index].prices.priceOld + 'AED',
                        style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        //Day.monday.toString().split('.')[1];
                        child: Text(data.items[index].cart.title.toString(),
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.white)),
                        color: Colors.orange,
                        onPressed: () {
                          NewHomeBloc().postAddToCart(
                              data.items[index].cart.value.toString());
                          showBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                    height: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(32.0),
                                      child: addToCart(),
                                    ));
                              });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget getHorizontalProducts(FlashData data) {
    return Container(
      height: 320.0,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.items.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 1.55),
        primary: false,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 5.0,
            child: new Column(
              children: <Widget>[
                FadeInImage.assetNetwork(
                  placeholder: 'images/awokPlaceholder.png',
                  image: data.items[index].image.src,
                  //result.output.data.items[index].image.src,
                ),
                Container(
                  margin:
                      const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
                  child: Text(
                    data.items[index].name,
                    maxLines: 2,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Text(data.items[index].prices.priceNew + 'AED'),
                    new Text(
                      data.items[index].prices.priceOld + 'AED',
                      style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      child: Text('ADD TO CART ',
                          style:
                              TextStyle(fontSize: 16.0, color: Colors.white)),
                      color: Colors.orange,
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
