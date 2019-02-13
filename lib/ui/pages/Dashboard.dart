import 'package:awok_starter/ui/pages/BaseStatelessPage.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Dashboard extends BaseStatelessPage {
  @override
  Widget build(BuildContext context) {
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
            child: getCategory(),
          ),
          Container(
            child: promotion(),
          ),
          Container(
            child: flashProducts(),
          )
        ],
      ),
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

  Widget getCategory() {
    return Container(
      height: 240.0,
      child: Card(
        elevation: 2.0,
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Menu',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 14.0),
                  ),
                ],
              ),
            ),
            GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 12,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, childAspectRatio: 1.55),
              primary: false,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                //return Card(
                // elevation: 5.0,
                return Column(
                  children: <Widget>[
                    // FadeInImage.assetNetwork(
                    //   placeholder: 'images/awokPlaceholder.png',
                    //   Icon(Icons.developer_board),
                    //   //result.output.data.items[index].image.src,
                    // ),
                    Icon(Icons.developer_board),
                    Container(
                      // margin:
                      //     const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
                      child: Text(
                        'data',
                        maxLines: 2,
                      ),
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

  Widget promotion() {
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
        Container(
          height: 240.0,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 1.2,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
            primary: false,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  FadeInImage.assetNetwork(
                    placeholder: 'images/awokPlaceholder.png',
                    image:
                        'https://s4c.awokcdn.com/static/images/products/iblock-e8b-e8bae98b4f024ca040afb0f0912c165a.jpg/default.jpg',
                    fit: BoxFit.fill,
                    //result.output.data.items[index].image.src,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget flashProducts() {
    return Center(
      child: 
    
    Container(
      height: 320.0,
      color: Colors.lightBlue,
      child: Center(
        child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio:1.9,
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
                     alignment: AlignmentDirectional(0.0, 0.0),
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                "https://s5d.awokcdn.com/static/images/products/iblock-94d-94d3317a32c040c61bbca6e86c52e305.jpg/default.jpg")
                        )
                    )),
                new Text("Flash \n Sale",
                    textScaleFactor: 1.5, style:TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 14.0),)
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
      ),alignment: Alignment(0.0, 1.0),
    ),
    );
  }
}
