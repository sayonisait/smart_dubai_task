
import 'package:awok_starter/bloc/CartBloc.dart';
import 'package:flutter/material.dart';
import 'package:awok_starter/entities/CartModel.dart';
List<int> items = [1, 2, 3, 4, 5, 6, 7, 8, 9];

class CartPage extends StatelessWidget {
 @override
 build(BuildContext context) {
  return Scaffold(
   appBar: AppBar(
    title: Text("Cart"),
   ),
   body: Container(
    child: StreamBuilder<CartModel>(
     stream: CartBloc().stream,
     builder: (context, AsyncSnapshot<CartModel> snapshot) {
      if (snapshot.hasError) {
       return Text(snapshot.error.toString());
      }
      if (snapshot.hasData) {
       return cartListview(context, snapshot);
      }
      return Center(child: new CircularProgressIndicator());
     },
    ),
   ),
  );
 }
}
cartListview(context, snapshot) {
 var basket = snapshot.data.output.data.basket;
 return ListView.builder(
   shrinkWrap: true,
   padding: const EdgeInsets.all(10),
   itemCount: basket.length,
   itemBuilder: (BuildContext ctxt, int index) {
    return Container(
     child: Column(
      children: <Widget>[
       Card(child: ListTile(title: Text(basket[index].store.storeName))),
       ListView.builder(
         primary: false,
         shrinkWrap: true,
         padding: const EdgeInsets.all(10),
         itemCount: basket[index].items.length,
         itemBuilder: (BuildContext ctxt, int childIndex) {
          return buildRowShowList(
            ctxt, basket[index].items[childIndex]);
         }),
      ],
     ),
    ); //
   });
}
Widget buildRowShowList(BuildContext bcontext, Item item) {
 return Container(
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
        onChanged: (newValue) {},
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
   trailing: IconButton(
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
