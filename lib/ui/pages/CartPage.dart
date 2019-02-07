import 'dart:async';

import 'package:awok_starter/bloc/CartBloc.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'package:awok_starter/entities/CartModel.dart';
//import 'CartModel.dart';
import 'package:awok_starter/data/api/CartApiProvider.dart';
import 'package:awok_starter/data/api/HttpManager.dart';


class Product {
  String name;
  int quantity;
//QUANTITY: {CURRENT: 1, MAX: 9}
  Product(this.name, this.quantity);
}

Cart result;
String prodqty;
List<Product> products;
List<int> items = [1, 2, 3, 4, 5, 6, 7, 8, 9];


class CartPage extends StatelessWidget {
  StreamController<Cart> _userStreamController;

  // void initState() {
  CartPage() {
    _userStreamController = StreamController();
    result = Cart();
    products = new List();
    getCartapiProducts();
    //    getcardSummary();
  }

  getCartapiProducts() async {
    //  Future<Cart> getcardSummary() async {
    String url = "https://ae.awok.com/api//v2/cart/";
    var otherResponse = await Apiprovider()
        .getUrl(
            url,
            {
              "Authorization":
                  "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiOTg1ODYiLCJ0b2tlbiI6IjkxYzQ0Mjk4Nzg4MDRjNWIxOGFhYjE1M2FhYzU2ZTY1In0.Wo36u205EjqKN1myYb4St0oTC_PiJrLOPNuV6284HZQ"
            },HttpMethods.GET
            )
        .then((onValue) {
      _userStreamController.sink.add(cartFromJson(onValue));
    }).catchError((onError) {
      _userStreamController.addError(onError.toString());
    });

    // result = cartFromJson(otherResponse);
    // for (int i = 0; i < result.output.data.basket[0].items.length; i++) {
    //   products.add(Product(result.output.data.basket[0].items[i].basket.name,
    //       result.output.data.basket[0].items[i].quantity.current));
    // } //
    print("eeeeeeeee${otherResponse.body}");

    return otherResponse;
  }

  @override
  build(BuildContext context) {
    //  getcardSummary();//
    print("ppppppppppp$products.length");
    // var widgetsample =

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Container(
        //
        //    decoration: BoxDecoration(
        //  border: Border.all(color: Colors.grey),
        //  borderRadius: BorderRadius.all(Radius.circular(1)),
        //    ),
        child: StreamBuilder<Cart>(
          stream: _userStreamController.stream,
          builder: (context, AsyncSnapshot<Cart> snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                  padding: const EdgeInsets.all(10),
                  itemCount: snapshot.data.output.data.basket.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Container(

                      child: Column(
                        children: <Widget>[
                          
                            Card( child:ListTile( title: Text( snapshot.data.output.data.basket[index].store.storeName))),
                            
                          ListView.builder(
                            shrinkWrap: true,
                              padding: const EdgeInsets.all(10),
                              itemCount: snapshot
                                  .data.output.data.basket[index].items.length,
                              itemBuilder: (BuildContext ctxt, int childIndex) {
                                return buildRowShowList(
                                    ctxt,
                                    snapshot.data.output.data.basket[index]
                                        .items[childIndex]);
                              }),
                        ],
                      ),
                    ); //
                  });
            }

            return Center(child: new CircularProgressIndicator());
          },
        ),
        // child: new ListView.builder(
        //     padding: const EdgeInsets.all(10),
        //     itemCount: products.length,
        //     itemBuilder: (BuildContext ctxt, int index) {
        //       return buildRowShowList(ctxt, index);
        //     }),
      ),
    );
  }
}

getListvie(ItemBasket){

}

Widget buildRowShowList(BuildContext bcontext, Item item) {
  return Container(
    // decoration:////
    //     new BoxDecoration(border: new Border(bottom: new BorderSide())),
    child: Card(
        child: ListTile(
      title: Text(item.basket.name),
      subtitle: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("qty:"),
              DropdownButton<int>(
                value: item.quantity.current,
                onChanged: (newValue) {
                  // setState(() {
                  //   products[index].quantity = newValue;
                  // });
                },
                items: items.map((int val) {
                  return DropdownMenuItem<int>(
                      value: val, child: Text(val.toString()));
                }).toList(),
              ),
              Text("x 4 aed "),
            ],
          ),
          Row(
            children: <Widget>[
              Text("fulfilled by :"),
              Text("AWOK "),
            ],
          ),
        ],
      ),
      leading: new Container(
          padding: EdgeInsets.all(8),
          child: new Image.network(
            item.images.thumb,
            height: 45.0,
            fit: BoxFit.fill,
          )),
      trailing: //CloseButton(

          //   // onPressed: (){

          //   //   setState(() {
          //   //      items.remove(index);
          //   //      print("items is $items");
          //   //   });
          //   // },
          // ),
          IconButton(
        icon: const Icon(Icons.close),
        tooltip: MaterialLocalizations.of(bcontext).closeButtonTooltip,
        onPressed: () {
          // products.removeAt(index);

          // setState(() {});//
        },
      ),
    )),
  );
}

Widget buildvendorShowList(BuildContext bcontext, Item item) {
  return Container(
// child: Card(
//   child: ListTile(
// title: Text("awok:vendor"),
//   ),
// ),
    child: new ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        itemBuilder: (BuildContext bcontext, int index) {}),
  );
}