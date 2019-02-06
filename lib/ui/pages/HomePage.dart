import 'package:awok_starter/bloc/HomeBloc.dart';
import 'package:awok_starter/bloc/NativeBlockProvider.dart';
import 'package:awok_starter/ui/pages/AccountPage.dart';
import 'package:awok_starter/ui/pages/BaseStatelessPage.dart';
import 'package:awok_starter/ui/pages/ProductsPage.dart';
import 'package:flutter/material.dart';

@immutable
class HomePage extends BaseStatelessPage {
  final List<Widget> _children = [AccountPage(), ProductsPage()];
   HomeBloc _bloc;

  Widget buildScafold() {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      bottomNavigationBar: buildBottomNavigation(),
    );
  }

  Widget buildBody() {
    //return Text('data');
    return Center(
        child: StreamBuilder(
            initialData: 0,
            stream: _bloc.indexStream,
            builder: (c, s) {
              return Center(child: Text('Data ${s.data}'));
            }));
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
          currentIndex: snapshoot.data ,
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
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<HomeBloc>(context);
    return buildScafold();
  }
}
