import 'package:awok_starter/data/api/HttpManager.dart';
import 'package:test_api/test_api.dart';

void main(){

  test('my first unit test', () {
  expect(  apiManager.getQueryParameters({"asdas":"asdas"}),"asdas=asdas&");
  

  });

}