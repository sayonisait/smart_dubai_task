import 'dart:async';
import 'package:awok_starter/bloc/NativeBlockProvider.dart';
import 'package:awok_starter/data/api/HttpManager.dart';
import 'package:awok_starter/di/DependencyInjection.dart';
import 'package:awok_starter/entities/CartModel.dart';
import 'package:flutter/material.dart';


class CounterWidget extends StatelessWidget {
  CounterBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = BlocProviderr.of<CounterBloc>(context);
    return getScafold();
  }

  Widget getScafold() {
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(),
      floatingActionButton: getFAB(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      title: Text('Home'),
    );
  }

  Widget getBody() {
    return Center(
        child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          getCounterValue(),
          getEmptyText(),
          getUserValue(),
          getCartCount()
        ],
      ),
    ));
  }

  Widget getFAB() {
    return FloatingActionButton(
      child: Text('+'),
      onPressed: () {
        bloc.fetchUser();
      },
    );
  }

  Widget getEmptyText() {
    return Text('No Data');
  }

  Widget getErrorWidget() {
    return Text('Server Error');
  }

  Widget getCounterValue() {
    return StreamBuilder<int>(
      stream: bloc.getCount,
      initialData: 0,
      builder: (c, snapshoot) {
        return Text(
          '${snapshoot.data}',
          style: TextStyle(fontSize: 30),
        );
      },
    );
  }

  Widget getUserValue() {
    return StreamBuilder<User>(
      stream: bloc.getUser,
      initialData: User.empty(),
      builder: (c, snapshoot) {
        return Text(
          '${snapshoot.data.firstName} ${snapshoot.data.lastName}',
          style: TextStyle(fontSize: 30),
        );
      },
    );
  }

  Widget getCartCount() {
    return StreamBuilder<CartModel>(
      stream: bloc.getCart,
      initialData: null,
      builder: (c, snapshoot) {
        if (snapshoot.hasError)
          return getErrorWidget();
        else
          return Text(
            '${snapshoot.data.output.data.summary.items.toString()}',
            style: TextStyle(fontSize: 30),
          );
      },
    );
  }
}

class CounterBloc extends BlocBase {
  // Screen Data :  Counter Bloc
  int _counter;
  StreamController _streamController = StreamController<int>();
  Stream<int> get getCount => _streamController.stream;
  StreamSink<int> get updateCount => _streamController.sink;

  // Screen Data :  Counter Bloc
  User _user;
  StreamController _userStreamController = StreamController<User>();
  Stream<User> get getUser => _userStreamController.stream;
  StreamSink<User> get updateUser => _userStreamController.sink;

  // Screen Data :  Cart Bloc
  CartModel _cartModel;
  StreamController _cartStreamController = StreamController<CartModel>();
  Stream<CartModel> get getCart => _cartStreamController.stream;
  StreamSink<CartModel> get updateCart => _cartStreamController.sink;

  CounterBloc() {
    init();
  }

  init() {
    _counter = 0;
    _user = User("Abi", "Abi lastName", 30);
  }

  void updateCounter() {
    _counter++;
    updateCount.add(_counter);
  }

  fetchUser() async {
    BaseRepository base = Injector().getRepository;
    base.getData().then((onValue) {
      _user = onValue;
      updateUser.add(_user);
    });
  }

  getCartCount() {
    homeRequest.getHomeProdutc().then((onValue) {
      _cartModel = CartDT.cartFromJson(onValue);
      updateCart.add(_cartModel);
    }).catchError((onError) {
      updateCart.addError(onError);
    });
  }

  @override
  void dispose() {
    _streamController.close();
  }
}

class User {
  String firstName, lastName;
  double age;

  User(this.firstName, this.lastName, this.age);

  User.empty() {
    firstName = "Aisha";
    lastName = "Ahmed";
    age = 1;
  }
}

abstract class BaseRepository {
  Future<User> getData();
}

class ApiRepository extends BaseRepository {
  @override
  Future<User> getData() async => await UserNetwork().getNetworkUser();
}

class MockRepository extends BaseRepository {
  @override
  Future<User> getData() async => await UserMock().getMockedUser();
}

HomeRequest homeRequest = HomeRequest();

class HomeRequest {
  Future getHomeProdutc() async => await apiManager.makeRequest(
      HttpMethods.GET, "https://ae.awok.com/api//v2/cart/");
}

class UserNetwork {
  Future getNetworkUser() async {
    await Future.delayed(Duration(milliseconds: 2000));
    return User("Network", "User", 30);
  }
}

class UserMock {
  Future getMockedUser() async {
    await Future.delayed(Duration(milliseconds: 1000));
    return User("Static", "User", 30);
  }
}
