import 'package:awok_starter/ui/pages/BaseStatelessPage.dart';
import 'package:flutter/material.dart';

class Settings extends BaseStatelessPage {
  List<String> names = [
    'Email',
    'Language',
    'My Profile',
    'Track Order',
    'My Cards',
    'My Coupons',
    'My Addresses',
    'Country',
    'Settings',
    'Notifications',
    'Logout'
  ];
  @override
  Widget build(BuildContext context) {
    return getScaffold(context);
  }

  Widget getScaffold(BuildContext context) {
    return Scaffold(
      body: getBody(context),
    );
  }

  Widget getBody(BuildContext context) {
    return getContent(context);
  }

  Widget getContent(BuildContext context) {
    return SingleChildScrollView(
      // scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                getImage(context),
                getProfilePic(),
              ],
            ),
          ),
          profileInfo(),
          Container(
            height: MediaQuery.of(context).size.height ,
            child: getSettingsList(),
          )
        ],
      ),
    );
    //);
  }

  Widget getImage(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      color: Colors.blueGrey,
      child: Image.asset(
        'images/citywalk.jpg',
        fit: BoxFit.fill,
      ),
      // Text('data', style: TextStyle(color: Colors.red),),
    );
  }

  Widget getProfilePic() {
    return FractionalTranslation(
      translation: Offset(0.0, 0.5),
      child: Container(
          width: 80.0,
          height: 80.0,
          //alignment: AlignmentDirectional(0.0, 0.0),
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage(
                      "https://s5d.awokcdn.com/static/images/products/iblock-94d-94d3317a32c040c61bbca6e86c52e305.jpg/default.jpg")))),
    );
  }

  Widget profileInfo() {
    return Container(
      padding: new EdgeInsets.only(top: 50.0),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text('Name'),
                  FlatButton(
                    //color: nil,
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(
                          color: Colors.grey, fontStyle: FontStyle.normal),
                    ),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget getSettingsList() {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
            color: Colors.grey,
          ),
      itemCount: names.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right:
                          new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.black),
            ),
            title: Text(
              names[index],
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          onTap: () => Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text(index.toString()))),
        );
      },
    );
  }
}
