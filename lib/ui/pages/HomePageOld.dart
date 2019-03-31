import 'package:awok_starter/bloc/HomePageOldBloc.dart';
import 'package:awok_starter/bloc/NativeBlockProvider.dart';
import 'package:awok_starter/bloc/ProductDetailsBloc.dart';
import 'package:awok_starter/entities/Item.dart';
import 'package:awok_starter/entities/Product.dart' as Product;
import 'package:awok_starter/ui/pages/BaseStatelessPage.dart';
import 'package:awok_starter/ui/pages/ProductDetailsPage.dart';
import 'package:flutter/material.dart';

class HomePageRoute extends BaseStatelessPage {
  HomePageOldBloc _bloc;
  ScrollController gridScrollController;

  HomePageRoute() {
    gridScrollController = new ScrollController();
    gridScrollController.addListener(loadMore);
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<HomePageOldBloc>(context);

    return buildScafold();
  }

  Widget buildScafold() {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.home,
            size: 30,
          ),
          title: Text(
            "AWOK",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: StreamBuilder(
            stream: _bloc.stream,
            builder: (context, AsyncSnapshot<HomePageData> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }

              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                case ConnectionState.active:
                case ConnectionState.done:
                  return getPage(snapshot.data, context);
              }
            }));
  }

  goToProductDetailPage(BuildContext context, Item item) {
    Product.ProductData product = Product.ProductData(
      prices: Product.Prices(
          msrp: item.prices.priceOld, current: item.prices.priceNew),
      name: item.name,
      id: item.linkedProdId,cart: item.cart
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider<ProductDetaisBloc>(
              bloc: ProductDetaisBloc(product),
              child: ProductDetailsPage("Product Details"),
            ),
      ),
    );
  }

  getFlashProducts(List<Item> items, bool largeDevice) {
    if (items.length > 0) {
      return Container(
          height: largeDevice ? 330 : 250,
          
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              itemExtent: largeDevice?200:150,
              itemBuilder: (context, i) {
                return 
                 Container(
                  child: 
                  getGridViewCell(items[i], context)
                )
                ;
              }));
    }
    return Container();
  }

  getPage(HomePageData data, BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Container(
        color: Colors.grey[200],
        child: SingleChildScrollView(
            controller: gridScrollController,
            child:
                // LayoutBuilder(builder: (context, constraints) {

                //   return

                Column(
              children: <Widget>[
                getBanner(
                  data.bannerUrl,
                ),
                getTitle(data.flashTitle),
                getFlashProducts(data.flashSales, queryData.size.width > 500),
                getTitle(data.title),
                _getGridView(data.products, context, queryData.size.width > 500)
              ],
            )

            //})
            ));
  }

  getTitle(String title) {
    if (title != null)
      return Container(
          padding: EdgeInsets.all(15),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ));
    return Container();
  }

  getBanner(String url) {
    if (url != null)
      return Container(
          margin: EdgeInsets.only(top: 5),
          child: Image.network(
            url,
          ));

    return Container();
  }

  Widget _getGridView(
      List<Item> results, BuildContext context, bool largeDevice) {
    return Container(
        child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                // childAspectRatio: constraints.maxWidth > 500 ? .68: .6,
                // crossAxisCount: constraints.maxWidth > 500 ? 3 : 2),
                childAspectRatio: largeDevice ? .68 : .65,
                crossAxisCount: largeDevice ? 3 : 2),
            shrinkWrap: true,
            primary: false,
            children: results.map((hit) {
              return getGridViewCell(hit, context);
            }).toList()));
  }

  Widget getGridViewCell(Item hit, BuildContext context) {
    return GestureDetector(
        onTap: () => goToProductDetailPage(context, hit),
        child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            child: Column(
              children: <Widget>[
                getItemImage(hit.image.src, hit.prices.discount.toString()),
                getItemName(hit.name),
                getPriceRow(
                  hit.prices.priceNew.toString(),
                  hit.prices.priceOld.toString(),
                ),
                getAddToCartButton()
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            )));
  }

  getAddToCartButton() {
    return Container(
        margin: EdgeInsets.only(left: 3, right: 3, bottom: 3),
        height: 28,
        width: double.infinity,
        child: FlatButton(
          child: Text('Add To Cart', style: TextStyle(color: Colors.white)),
          onPressed: () {},
          color: Colors.blue[800],
        ));
  }

  getItemImage(String imageUrl, String discount) {
    return AspectRatio(
      aspectRatio: 1,
      child: Image.network(
        imageUrl,
        width: 400,
      ),
    );
  }

  getItemName(String itemName) {
    return Container(
      child: Text(
        itemName,
        style: TextStyle(fontSize: 12),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ),
    );
  }

  getPriceRow(String newPrice, String oldPrice) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          getNewPriceText(newPrice),
          getOldPriceText(oldPrice),
        ],
      ),
    );
  }

  getNewPriceText(String newPrice) {
    return Text(
      "  AED " + newPrice,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  getOldPriceText(String oldPrice) {
    return Text(
      "AED " + oldPrice,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: 11,
          color: Colors.grey,
          decoration: TextDecoration.lineThrough),
      textAlign: TextAlign.center,
    );
  }

  getDiscountText(String discount) {
    return Container(
      color: Colors.red[500],
      padding: EdgeInsets.all(5),
      child: Text(
        discount + "%",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  void loadMore() {
    if (gridScrollController.position.maxScrollExtent -
            gridScrollController.position.pixels <
        2000) {
      _bloc.event.add(LoadMoreEvent());
    }
  }

  
}
