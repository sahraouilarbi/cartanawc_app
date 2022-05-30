import '../../domain/entities/entities.dart';
import '../models/models.dart';

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