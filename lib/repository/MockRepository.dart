
import 'package:awok_starter/entities/ProductDetail.dart';
import 'package:awok_starter/repository/BaseRepository.dart';
import 'package:awok_starter/ui/CounterWidget.dart';

class MockRepository extends BaseRepository {
  @override
  Future<User> getData() async => await UserMock().getMockedUser();

  @override
  Future<ProductDetail> getProductDetail(String productID) {
    return null;
  }
}