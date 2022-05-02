import 'package:cartanawc_app/data/models/billing_model.dart';
import 'package:cartanawc_app/data/models/cart_response_model.dart';
import 'package:cartanawc_app/data/models/categorie_model.dart';
import 'package:cartanawc_app/data/models/customer_detail_model.dart';
import 'package:cartanawc_app/data/models/customer_model.dart';
import 'package:cartanawc_app/data/models/forgot_password_response_model.dart';
import 'package:cartanawc_app/data/models/login_model.dart';
import 'package:cartanawc_app/data/models/meta_data_model.dart';
import 'package:cartanawc_app/data/models/order_detail_model.dart';
import 'package:cartanawc_app/data/models/order_model.dart';
import 'package:cartanawc_app/data/models/product_model.dart';
import 'package:cartanawc_app/data/models/shipping_model.dart';
import 'package:cartanawc_app/data/models/variable_product_model.dart';
import 'package:cartanawc_app/domain/entities/billing_entity.dart';
import 'package:cartanawc_app/domain/entities/cart_response_entity.dart';
import 'package:cartanawc_app/domain/entities/categorie_entity.dart';
import 'package:cartanawc_app/domain/entities/customer_detail_entity.dart';
import 'package:cartanawc_app/domain/entities/customer_entity.dart';
import 'package:cartanawc_app/domain/entities/forgot_password_response_entity.dart';
import 'package:cartanawc_app/domain/entities/login_entity.dart';
import 'package:cartanawc_app/domain/entities/meta_data_entity.dart';
import 'package:cartanawc_app/domain/entities/order_detail_entity.dart';
import 'package:cartanawc_app/domain/entities/order_entity.dart';
import 'package:cartanawc_app/domain/entities/product_entity.dart';
import 'package:cartanawc_app/domain/entities/shipping_entity.dart';
import 'package:cartanawc_app/domain/entities/variable_product_entity.dart';

// LoginResponseModel
extension LoginResponseModelMapper on LoginResponseModel {
  LoginResponseEntity toDomain() {
    return LoginResponseEntity(
      success: success,
      statusCode: statusCode,
      code: code,
      message: message,
      data: data.toDomain(),
    );
  }
}

// DataModel
extension DataModelMapper on DataModel {
  DataEntity toDomain() {
    return DataEntity(
      token: token,
      id: id,
      email: email,
      nicename: nicename,
      firstName: firstName,
      lastName: lastName,
      displayName: displayName,
    );
  }
}

// CustomerDetailModel
extension CustomerDetailModelMapper on CustomerDetailModel {
  CustomerDetailEntity toDomain() {
    return CustomerDetailEntity(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
      role: role,
      billing: billing.toDomain(),
      shipping: shipping.toDomain(),
      avatarUrl: avatarUrl,
    );
  }
}

// BillingModel
extension BillingModelMapper on BillingModel {
  BillingEntity toDomain() {
    return BillingEntity(
      firstName: firstName,
      lastName: lastName,
      company: company,
      address1: address1,
      address2: address2,
      city: city,
      state: state,
      postcode: postcode,
      country: country,
      email: email,
      phone: phone,
    );
  }
}

// ShippingModel
extension ShippingModelMapper on ShippingModel {
  ShippingEntity toDomain() {
    return ShippingEntity(
      firstName: firstName,
      lastName: lastName,
      company: company,
      address1: address1,
      address2: address2,
      city: city,
      state: state,
      postcode: postcode,
      country: country,
    );
  }
}

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

// CategorieModel
extension CategorieModelMapper on CategoryModel {
  CategoryEntity toDomain() {
    return CategoryEntity(
      categoryId,
      categoryName,
      categorySlug,
      categoryParent,
      categoryDescription,
      categoryImage.toDomain(),
    );
  }
}

// CategorieImageModel
extension CategorieImageModelMapper on CategoryImageModel {
  CategoryImageEntity toDomain() {
    return CategoryImageEntity(
      src: src,
    );
  }
}

// CustomerModel
extension CustomerModelMapper on CustomerModel {
  CustomerEntity toDomain() {
    return CustomerEntity(
      email: email,
      firstName: firstName,
      lastName: lastName,
      password: password,
    );
  }
}

// ForgotResponseModel
extension ForgotPasswordResponseModelMapper on ForgotPasswordResponseModel {
  ForgotPasswordResponseEntity toDomain() {
    return ForgotPasswordResponseEntity(email);
  }
}

// OrderDetailModel
extension OrderDetailModelMappser on OrderDetailModel {
  OrderDetailEntity toDomain() {
    final List<LineItemsEntity> lineItemsMapped =
        (lineItems.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<LineItemsEntity>()
            .toList();
    return OrderDetailEntity(
      orderId: orderId,
      orderNumber: orderNumber,
      paymentMethod: paymentMethod,
      orderStatus: orderStatus,
      orderDate: orderDate,
      shipping: shipping.toDomain(),
      lineItems: lineItemsMapped,
      totalAmount: totalAmount,
      shippingTotal: shippingTotal,
      itemTotalAmount: itemTotalAmount,
    );
  }
}

// LineItemsModel
extension LineItemsModelMapper on LineItemsModel {
  LineItemsEntity toDomain() {
    return LineItemsEntity(
      productId: productId,
      productName: productName,
      quantity: quantity,
      variationId: variationId,
      totalAmount: totalAmount,
    );
  }
}

// OrderModel
extension OrderModelMapper on OrderModel {
  OrderEntity toDomain() {
    final List<OrderLineItemsEntity> _lineItemsMapped =
        (lineItems.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderLineItemsEntity>()
            .toList();
    return OrderEntity(
      customerId: customerId,
      paymentMethodTitle: paymentMethodTitle,
      setPaid: setPaid,
      transactionId: transactionId,
      lineItems: _lineItemsMapped,
      orderId: orderId,
      orderNumber: orderNumber,
      orderKey: orderKey,
      status: status,
      orderDateCreated: orderDateCreated,
      orderTotal: orderTotal,
    );
  }
}

// OrderLineItemsModel
extension OrderLineItemsModelMapper on OrderLineItemsModel {
  OrderLineItemsEntity toDomain() {
    return OrderLineItemsEntity(
      productId: productId,
      variationId: variationId,
      quantity: quantity,
      subtotal: subtotal,
    );
  }
}

// OrderMetaDataModel
extension MetaDataModelMapper on MetaDataModel {
  MetaDataEntity toDomain() {
    return MetaDataEntity(
      id: id,
      key: key,
      value: value,
    );
  }
}

// ProductModel
extension ProductModelMapper on ProductModel {
  ProductEntity toDomain() {
    final List<ImageProductEntity> _imagesMapped =
        (images.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<ImageProductEntity>()
            .toList();
    final List<CategoriesEntity> _categoriesMapped =
        (categories.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<CategoriesEntity>()
            .toList();
    final List<AttributesEntity> _attributesMapped =
        (attributes.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<AttributesEntity>()
            .toList();
    final List<int> _relatedIdsMapped =
        (relatedIds.map((v) => v) ?? const Iterable.empty())
            .cast<int>()
            .toList();
    final List<ProductMetaDataEntity> _productMetaDataMapped =
        (productMetaData.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<ProductMetaDataEntity>()
            .toList();
    return ProductEntity(
      id: id,
      name: name,
      description: description,
      shortDescription: shortDescription,
      type: type,
      status: status,
      sku: sku,
      price: price,
      regularPrice: regularPrice,
      salePrice: salePrice,
      stockStatus: stockStatus,
      images: _imagesMapped,
      categories: _categoriesMapped,
      attributes: _attributesMapped,
      relatedIds: _relatedIdsMapped,
      variableProduct: variableProduct.toDomain(),
      productMetaData: _productMetaDataMapped,
      acf: acf.toDomain(),
    );
  }
}

// ImageProductModel
extension ImageProductModelMapper on ImageProductModel {
  ImageProductEntity toDomain() {
    return ImageProductEntity(
      src: src,
      woocommerceThumbnail: woocommerceThumbnail,
      woocommerceSingle: woocommerceSingle,
      woocommerceGalleryThumbnail: woocommerceGalleryThumbnail,
    );
  }
}

// CategoriesModel
extension CategoriesModelMapper on CategoriesModel {
  CategoriesEntity toDomain() {
    return CategoriesEntity(
      id: id,
      name: name,
    );
  }
}

// AttributesModel
extension AttributesModelMapper on AttributesModel {
  AttributesEntity toDomain() {
    final List<String> _optionsMapped =
        (options.map((e) => e)).cast<String>().toList();
    return AttributesEntity(
      id: id,
      name: name,
      options: _optionsMapped,
    );
  }
}

// VariableProductModel
extension VariableProductModelMapper on VariableProductModel {
  VariableProductEntity toDomain() {
    final List<AttributesEntity> _attributesMapped =
        (attributes.map((e) => e.toDomain()) ?? const Iterable.empty())
            .cast<AttributesEntity>()
            .toList();
    return VariableProductEntity(
        id: id,
        sku: sku,
        price: price,
        regularPrice: regularPrice,
        salePrice: salePrice,
        attributes: _attributesMapped);
  }
}

// ACFModel
extension ACFModelMapper on ACFModel {
  ACFEntity toDomain() {
    return ACFEntity(
      contenance: contenance,
      grossite: grossite,
      superGros: superGros,
      grandeMoyenneSurface: grandeMoyenneSurface,
      hypermarche: hypermarche,
    );
  }
}

/*
    Fonction pour maper les lists
    List<Entity> VARIABLE_mapped = (VARIABLE.map((v) => v.toDomain()) ?? const Iterable.empty()).cast<Entity>().toList();
 */