
import 'package:awok_starter/bloc/DashboardBloc.dart';
import 'package:awok_starter/bloc/NativeBlockProvider.dart';
import 'package:awok_starter/entities/AddToCart.dart';
import 'package:awok_starter/entities/FlashProducts.dart';
import 'package:awok_starter/entities/Products.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  DashboardBloc bloc;

  // bool isBannerAvailable = false;
  HomeData data;

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<DashboardBloc>(context);
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
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            child: getBanner(),
          ),
          Container(
            child: getFlashProducts(),
          ),
          Container(
            child: getProducts(),
          ),
        ],
      ),
    );
  }

  Widget getBanner() {
    return StreamBuilder(
      stream: bloc.myProducts,
      builder: (c, snapshoot) {
        if (snapshoot.hasData) {
          //data = snapshoot.data.output.data;
          return Container(
            child: Image.network(
              snapshoot.data.output.data.banner.url ?? null,
              fit: BoxFit.fitHeight,
              //result.output.data.items[index].image.src,
            ),
          );

          // getGridview(snapshoot.data.output.data, null);
        } else
          return CircularProgressIndicator();
      },
    );
  }

  Widget getProducts() {
    return StreamBuilder(
      stream: bloc.myProducts,
      builder: (c, snapshoot) {
        if (snapshoot.hasData) {
          data = snapshoot.data.output.data;
          return getVerticalProducts(data);
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
      stream: bloc.myFlashProducts,
      builder: (c, snapshoot) {
        if (snapshoot.hasData)
          return getHorizontalProducts(snapshoot.data.output.data);
        //getGridview(null, snapshoot.data.output.data);
        else
          return Center(
            child: CircularProgressIndicator(),
          );
      },
    );
  }

  Widget getErrorTest() {
    return Text('Not Valid Input, Please try again');
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
                          bloc.postAddToCart(
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

  Widget addToCart() {
    return StreamBuilder<AddToCart>(
      stream: bloc.addCart,
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

