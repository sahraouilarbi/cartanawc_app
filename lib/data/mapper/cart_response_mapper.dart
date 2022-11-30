import 'package:cartanawc_app/core/extensions.dart';
import 'package:cartanawc_app/data/models/models.dart';
import 'package:cartanawc_app/domain/entities/entities.dart';

// CartResponseModel
extension CartResponseModelMapper on CartResponseModel? {
  CartResponseEntity toDomain() {
    final List<CartItemEntity> dataMapped =
        (this?.data?.map((_e) => _e.toDomain()) ?? const Iterable.empty())
            .cast<CartItemEntity>()
            .toList();
    return CartResponseEntity(
      status: this?.status?.orFalseBool() ?? false,
      data: dataMapped,
    );
  }
}

// CartItemModel
extension CartItemModelMapper on CartItemModel? {
  CartItemEntity toDomain() {
    return CartItemEntity(
      productId: this?.productId?.orZero() ?? kZERO,
      productName: this?.productName?.orEmpty() ?? kEMPTY,
      productRegularPrice: this?.productRegularPrice?.orEmpty() ?? kEMPTY,
      productSalePrice: this?.productSalePrice?.orEmpty() ?? kEMPTY,
      thumbnail: this?.thumbnail?.orEmpty() ?? kEMPTY,
      qty: this?.qty?.orZero() ?? kZERO,
      productStep: this?.productStep?.orEmpty() ?? kEMPTY,
      lineSubtotal: this?.lineSubtotal?.orZeroDouble() ?? kZeroDouble,
      lineTotal: this?.lineTotal?.orZeroDouble() ?? kZeroDouble,
      variationId: this?.variationId?.orZero() ?? kZERO,
      attribute: this?.attribute?.orEmpty() ?? kEMPTY,
      attributeValue: this?.attributeValue?.orEmpty() ?? kEMPTY,
    );
  }
}
