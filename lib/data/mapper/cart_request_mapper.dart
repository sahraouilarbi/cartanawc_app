import 'package:cartanawc_app/data/models/models.dart';
import 'package:cartanawc_app/domain/entities/entities.dart';

extension CartRequestEntityMapper on CartRequestEntity {
  CartRequestModel toModel() {
    final List<CartProductsModel> _productsMapped =
        products.map((e) => e).cast<CartProductsModel>().toList();
    return CartRequestModel(
      userId: userId,
      products: _productsMapped,
    );
  }
}
