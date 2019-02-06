import 'dart:async';

import 'package:awok_starter/bloc/NativeBlockProvider.dart';

class HomeBloc extends BlocBase {
  int _currentIndex ;
  StreamController<int> streamCurrentIndex = StreamController.broadcast();
  StreamSink<int> get indexSink => streamCurrentIndex.sink;
  Stream<int> get indexStream => streamCurrentIndex.stream;


  HomeBloc(){
  _currentIndex = 0 ;
  streamCurrentIndex.stream.listen(onListen);
  }
  // HomeBloc.empty(){
  //   _currentIndex = 0; 
  // }
  

  @override
  void dispose() {
    streamCurrentIndex.close();
  }

  void onListen(int value) {
    print('data received:$value');
  }

  ontabChange(int value){
    _currentIndex = value;
    indexSink.add(_currentIndex);
  }
}
