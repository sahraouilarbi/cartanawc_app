import '/data/models/models.dart';
import '/domain/entities/entities.dart';

// CartResponseModel
extension CartResponseModelMapper on CartResponseModel {
  CartResponseEntity toDomain() {
    final List<CartItemEntity> dataMapped =
        (data.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<CartItemEntity>()
            .toList();
    return CartResponseEntity(
      status: status,
      data: dataMapped,
    );
  }
}

// CartItemModel
extension CartItemModelMapper on CartItemModel {
  CartItemEntity toDomain() {
    return CartItemEntity(
      productId: productId,
      productName: productName,
      productRegularPrice: productRegularPrice,
      productSalePrice: productSalePrice,
      thumbnail: thumbnail,
      qty: qty,
      productStep: productStep,
      lineSubtotal: lineSubtotal,
      lineTotal: lineTotal,
      variationId: variationId,
      attribute: attribute,
      attributeValue: attributeValue,
    );
  }
}
