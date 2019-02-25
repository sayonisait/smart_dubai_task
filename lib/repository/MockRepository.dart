
import 'package:awok_starter/entities/Product.dart';
import 'package:awok_starter/entities/ProductImages.dart';
import 'package:awok_starter/repository/BaseRepository.dart';
import 'package:awok_starter/ui/CounterWidget.dart';

class MockRepository extends BaseRepository {
  @override
  Future<User> getData() async => await UserMock().getMockedUser();

  @override
  Future<Product> getProductDetail(String productID) {
    return null;
  }

  @override
  Future<ProductImages> getProductImages(String productID) {
    // TODO: implement getProductImages
    return null;
  }
}