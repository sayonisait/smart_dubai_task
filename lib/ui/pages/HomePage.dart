import 'package:awok_starter/bloc/HomeBloc.dart';
import 'package:awok_starter/bloc/NativeBlockProvider.dart';
import 'package:awok_starter/ui/pages/AccountPage.dart';
import 'package:awok_starter/ui/pages/BaseStatelessPage.dart';
import 'package:awok_starter/ui/pages/CartPage.dart';
import 'package:awok_starter/ui/pages/ProductsPage.dart';
import 'package:flutter/material.dart';

@immutable
class HomePage extends BaseStatelessPage {
  final List<Widget> _children = [
    ProductsPage("Products"),
    //CartPage("Cart"),
    AccountPage("My Account")
  ];
  TabController _tabController;
  PageController _pageController;
  HomeBloc _bloc;

  HomePage() {
    _pageController = PageController();
  }

  Widget buildScafold() {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: buildAppBar(),
      body: buildBody(),
      bottomNavigationBar: buildBottomNavigation(),
    );
  }

  Widget buildBody() {
    return PageView(
      children: _children,
      controller: _pageController,
      onPageChanged: onTabChanged,
    );
  }

  Widget buildAppBar() {
    return AppBar(
      title: Text('Awok'),
    );
  }

  Widget buildBottomNavigation() {
    return StreamBuilder<int>(
      stream: _bloc.indexStream,
      initialData: 0,
      builder: (c, snapshoot) {
        return BottomNavigationBar(
          currentIndex: snapshoot.data,
          items: [
            BottomNavigationBarItem(
                icon: new Icon(Icons.home), title: Text('')),
            BottomNavigationBarItem(
                icon: new Icon(Icons.shopping_basket), title: Text('')),
            BottomNavigationBarItem(icon: Icon(Icons.person), title: Text(''))
          ],
          onTap: onTabChanged,
        );
      },
    );
  }

  //Page Events
  void onTabChanged(int value) {
    _bloc.ontabChange(value);
    _pageController.animateToPage(value,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<HomeBloc>(context);
    return buildScafold();
  }
}
