import 'package:cartanawc_app/data/models/billing_model.dart';
import 'package:cartanawc_app/data/models/shipping_model.dart';

class OrderModel {
  OrderModel({
    this.id,
    this.parentId,
    this.number,
    this.orderKey,
    this.createdVia,
    this.version,
    this.status,
    this.currency,
    this.dateCreated,
    this.dateCreatedGMT,
    this.dateModified,
    this.dateModifiedGMT,
    this.discountTotal,
    this.discountTax,
    this.shippingTotal,
    this.shippingTax,
    this.cartTax,
    this.total,
    this.totalTax,
    this.pricesIncludeTax,
    this.customerId,
    this.customerIpAddress,
    this.customerUserAgent,
    this.customerNote,
    this.billing,
    this.shipping,
    this.paymentMethod,
    this.paymentMethodTitle,
    this.transactionId,
    this.datePaid,
    this.datePaidGMT,
    this.dateCompleted,
    this.dateCompletedGMT,
    this.cartHash,
    this.metaData,
    this.lineItems,
    this.taxLines,
    this.shippingLines,
    this.feeLines,
    this.couponLines,
    this.refunds,
    this.setPaid,
  });
  int id;
  int parentId;
  String number;
  String orderKey;
  String createdVia;
  String version;
  String status;
  String currency;
  DateTime dateCreated;
  DateTime dateCreatedGMT;
  DateTime dateModified;
  DateTime dateModifiedGMT;
  String discountTotal;
  String discountTax;
  String shippingTotal;
  String shippingTax;
  String cartTax;
  String total;
  String totalTax;
  bool pricesIncludeTax;
  int customerId;
  String customerIpAddress;
  String customerUserAgent;
  String customerNote;
  BillingModel billing;
  ShippingModel shipping;
  String paymentMethod;
  String paymentMethodTitle;
  String transactionId;
  DateTime datePaid;
  DateTime datePaidGMT;
  DateTime dateCompleted;
  DateTime dateCompletedGMT;
  String cartHash;
  List<OrderMetaDataModel> metaData;
  List<OrderLineItemsModel> lineItems;
  List<OrderTaxLinesModel> taxLines;
  List<OrderShippingLinesModel> shippingLines;
  List<OrderFeeLinesModel> feeLines;
  List<OrderCouponLinesModel> couponLines;
  List<OrderRefundsModel> refunds;
  bool setPaid;
  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    parentId = json['parent_id'] as int;
    number = json['number'] as String;
    orderKey = json['order_key'] as String;
    createdVia = json['created_via'] as String;
    version = json['version'] as String;
    status = json['status'] as String;
    currency = json['currency'] as String;
    dateCreated = json['date_created'] as DateTime;
    dateCreatedGMT = json['date_created_gmt'] as DateTime;
    dateModified = json['date_modified'] as DateTime;
    dateModifiedGMT = json['date_modified_gmt'] as DateTime;
    discountTotal = json['discount_total'] as String;
    discountTax = json['discount_tax'] as String;
    shippingTotal = json['shipping_total'] as String;
    shippingTax = json['shipping_tax'] as String;
    cartTax = json['cart_tax'] as String;
    total = json['total'] as String;
    totalTax = json['total_tax'] as String;
    pricesIncludeTax = json['prices_include_tax'] as bool;
    customerId = json['customer_id'] as int;
    customerIpAddress = json['customer_ip_address'] as String;
    customerUserAgent = json['customer_user_agent'] as String;
    customerNote = json['customer_note'] as String;
    billing = json['billing'] as BillingModel;
    shipping = json['shipping'] as ShippingModel;
    paymentMethod = json['payment_method'] as String;
    paymentMethodTitle = json['payment_method_title'] as String;
    transactionId = json['transaction_id'] as String;
    datePaid = json['date_paid'] as DateTime;
    datePaidGMT = json['date_paid_gmt'] as DateTime;
    dateCompleted = json['date_completed'] as DateTime;
    dateCompletedGMT = json['date_completed_gmt'] as DateTime;
    cartHash = json['cart_hash'] as String;

    if (json['meta_data'] != null) {
      metaData = List<OrderMetaDataModel>.from((json['meta_data'] as List)
          .map((x) => OrderMetaDataModel.fromJson(x as Map<String, dynamic>)));
    }

    if (json['line_items'] != null) {
      lineItems = List<OrderLineItemsModel>.from((json['line_items'] as List)
          .map((x) => OrderLineItemsModel.fromJson(x as Map<String, dynamic>)));
    }

    if (json['tax_lines'] != null) {
      taxLines = List<OrderTaxLinesModel>.from((json['tax_lines'] as List)
          .map((x) => OrderTaxLinesModel.fromJson(x as Map<String, dynamic>)));
    }

    if (json['shipping_lines'] != null) {
      shippingLines = List<OrderShippingLinesModel>.from(
          (json['shipping_lines'] as List).map((x) =>
              OrderShippingLinesModel.fromJson(x as Map<String, dynamic>)));
    }

    if (json['fee_lines'] != null) {
      feeLines = List<OrderFeeLinesModel>.from((json['fee_lines'] as List)
          .map((x) => OrderFeeLinesModel.fromJson(x as Map<String, dynamic>)));
    }

    if (json['coupon_lines'] != null) {
      couponLines = List<OrderCouponLinesModel>.from(
          (json['coupon_lines'] as List).map((x) =>
              OrderCouponLinesModel.fromJson(x as Map<String, dynamic>)));
    }

    if (json['refunds'] != null) {
      refunds = List<OrderRefundsModel>.from((json['refunds'] as List)
          .map((x) => OrderRefundsModel.fromJson(x as Map<String, dynamic>)));
    }

    setPaid = json['set_paid'] as bool;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['parent_id'] = parentId;
    data['number'] = number;
    data['order_key'] = orderKey;
    data['created_via'] = createdVia;
    data['version'] = version;
    data['status'] = status;
    data['currency'] = currency;
    data['date_created'] = dateCreated;
    data['date_created_gmt'] = dateCreatedGMT;
    data['date_modified'] = dateModified;
    data['date_modified_gmt'] = dateModifiedGMT;
    data['discount_total'] = discountTotal;
    data['discount_tax'] = discountTax;
    data['shipping_total'] = shippingTotal;
    data['shipping_tax'] = shippingTax;
    data['cart_tax'] = cartTax;
    data['total'] = total;
    data['total_tax'] = totalTax;
    data['prices_include_tax'] = pricesIncludeTax;
    data['customer_id'] = customerId;
    data['customer_ip_address'] = customerIpAddress;
    data['customer_user_agent'] = customerUserAgent;
    data['customer_note'] = customerNote;
    data['billing'] = billing;
    data['shipping'] = shipping;
    data['payment_method'] = paymentMethod;
    data['payment_method_title'] = paymentMethodTitle;
    data['transaction_id'] = transactionId;
    data['date_paid'] = datePaid;
    data['date_paid_gmt'] = datePaidGMT;
    data['date_completed'] = dateCompleted;
    data['date_completed_gmt'] = dateCompletedGMT;
    data['cart_hash'] = cartHash;

    if (metaData != null) {
      data['meta_data'] = metaData.map((v) => v.toJson()).toList();
    }

    if (lineItems != null) {
      data['line_items'] = lineItems.map((v) => v.toJson()).toList();
    }

    if (taxLines != null) {
      data['tax_lines'] = taxLines.map((v) => v.toJson()).toList();
    }

    if (shippingLines != null) {
      data['shipping_lines'] = shippingLines.map((v) => v.toJson()).toList();
    }

    if (feeLines != null) {
      data['fee_lines'] = feeLines.map((v) => v.toJson()).toList();
    }

    if (couponLines != null) {
      data['coupon_lines'] = couponLines.map((v) => v.toJson()).toList();
    }

    if (refunds != null) {
      data['refunds'] = refunds.map((v) => v.toJson()).toList();
    }

    data['set_paid'] = setPaid;

    return data;
  }
}

class OrderMetaDataModel {
  OrderMetaDataModel({
    this.id,
    this.key,
    this.value,
  });
  int id;
  String key;
  String value;
  OrderMetaDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    key = json['key'] as String;
    value = json['key'] as String;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['key'] = key;
    data['value'] = value;
    return data;
  }
}

class OrderLineItemsModel {
  OrderLineItemsModel({
    this.id,
    this.name,
    this.productId,
    this.variationId,
    this.quantity,
    this.taxClass,
    this.subtotal,
    this.subtotalTax,
    this.total,
    this.totalTax,
    this.taxes,
    this.metaData,
    this.sku,
    this.price,
  });
  int id;
  String name;
  int productId;
  int variationId;
  int quantity;
  String taxClass;
  String subtotal;
  String subtotalTax;
  String total;
  String totalTax;
  List<OrderTaxesModel> taxes;
  List<OrderMetaDataModel> metaData;
  String sku;
  String price;
  OrderLineItemsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'] as String;
    productId = json['product_id'] as int;
    variationId = json['variation_id'] as int;
    quantity = json['quantity'] as int;
    taxClass = json['tax_class'] as String;
    subtotal = json['subtotal'] as String;
    subtotalTax = json['subtotal_tax'] as String;
    total = json['total'] as String;
    totalTax = json['total_tax'] as String;

    if (json['taxes'] != null) {
      taxes = List<OrderTaxesModel>.from((json['taxes'] as List)
          .map((x) => OrderTaxesModel.fromJson(x as Map<String, dynamic>)));
    }

    if (json['meta_data'] != null) {
      metaData = List<OrderMetaDataModel>.from((json['meta_data'] as List)
          .map((x) => OrderMetaDataModel.fromJson(x as Map<String, dynamic>)));
    }

    sku = json['sku'] as String;
    price = json['price'] as String;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['product_id'] = productId;
    data['variation_id'] = variationId;
    data['quantity'] = quantity;
    data['tax_class'] = taxClass;
    data['subtotal'] = subtotal;
    data['subtotal_tax'] = subtotalTax;
    data['total'] = total;
    data['total_tax'] = totalTax;

    if (taxes != null) {
      data['taxes'] = taxes.map((v) => v.toJson()).toList();
    }

    if (metaData != null) {
      data['meta_data'] = metaData.map((v) => v.toJson()).toList();
    }

    data['sku'] = sku;
    data['price'] = price;
    return data;
  }
}

class OrderTaxLinesModel {
  OrderTaxLinesModel({
    this.id,
    this.rateCode,
    this.rateId,
    this.label,
    this.compound,
    this.taxTotal,
    this.shippingTaxTotal,
    this.metaData,
  });
  int id;
  String rateCode;
  String rateId;
  String label;
  bool compound;
  String taxTotal;
  String shippingTaxTotal;
  List<OrderMetaDataModel> metaData;
  OrderTaxLinesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] = id;
    rateCode = json['rate_code'] as String;
    rateId = json['rate_id'] as String;
    label = json['label'] as String;
    compound = json['compound'] as bool;
    taxTotal = json['tax_total'] as String;
    shippingTaxTotal = json['shipping_tax_total'] as String;

    if (json['meta_data'] != null) {
      metaData = List<OrderMetaDataModel>.from((json['meta_data'] as List)
          .map((x) => OrderMetaDataModel.fromJson(x as Map<String, dynamic>)));
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rate_code'] = rateCode;
    data['rate_id'] = rateId;
    data['label'] = label;
    data['compound'] = compound;
    data['tax_total'] = taxTotal;
    data['shipping_tax_total'] = shippingTaxTotal;

    if (metaData != null) {
      data['meta_data'] = metaData.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class OrderShippingLinesModel {
  OrderShippingLinesModel({
    this.id,
    this.methodTitle,
    this.methodId,
    this.total,
    this.totalTax,
    this.taxes,
    this.metaData,
  });

  int id;
  String methodTitle;
  String methodId;
  String total;
  String totalTax;
  List<OrderTaxesModel> taxes;
  List<OrderMetaDataModel> metaData;
  OrderShippingLinesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    methodTitle = json['method_title'] as String;
    methodId = json['method_id'] as String;
    total = json['total'] as String;
    totalTax = json['total_tax'] as String;
    if (json['taxes'] != null) {
      taxes = List<OrderTaxesModel>.from((json['taxes'] as List)
          .map((x) => OrderTaxesModel.fromJson(x as Map<String, dynamic>)));
    }
    if (json['meta_data'] != null) {
      metaData = List<OrderMetaDataModel>.from((json['meta_data'] as List)
          .map((x) => OrderMetaDataModel.fromJson(x as Map<String, dynamic>)));
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['method_title'] = methodTitle;
    data['method_id'] = methodId;
    data['total'] = total;
    data['total_tax'] = totalTax;
    if (taxes != null) {
      data['taxes'] = taxes.map((v) => v.toJson()).toList();
    }
    if (metaData != null) {
      data['meta_data'] = metaData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderFeeLinesModel {
  OrderFeeLinesModel({
    this.id,
    this.name,
    this.taxClass,
    this.taxStatus,
    this.total,
    this.totalTax,
    this.taxes,
    this.metaData,
  });

  int id;
  String name;
  String taxClass;
  String taxStatus;
  String total;
  String totalTax;
  List<OrderTaxesModel> taxes;
  List<OrderMetaDataModel> metaData;
  OrderFeeLinesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'] as String;
    taxClass = json['tax_class'] as String;
    taxStatus = json['tax_status'] as String;
    total = json['total'] as String;
    totalTax = json['total_tax'] as String;

    if (json['taxes'] != null) {
      taxes = List<OrderTaxesModel>.from((json['taxes'] as List)
          .map((x) => OrderTaxesModel.fromJson(x as Map<String, dynamic>)));
    }
    if (json['meta_data'] != null) {
      metaData = List<OrderMetaDataModel>.from((json['meta_data'] as List)
          .map((x) => OrderMetaDataModel.fromJson(x as Map<String, dynamic>)));
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['tax_class'] = taxClass;
    data['tax_status'] = taxStatus;
    data['total'] = total;
    data['total_tax'] = totalTax;
    if (taxes != null) {
      data['taxes'] = taxes.map((v) => v.toJson()).toList();
    }
    if (metaData != null) {
      data['meta_data'] = metaData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderCouponLinesModel {
  OrderCouponLinesModel({
    this.id,
    this.code,
    this.discount,
    this.discountTax,
    this.metaData,
  });
  int id;
  String code;
  String discount;
  String discountTax;
  List<OrderMetaDataModel> metaData;

  OrderCouponLinesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    code = json['code'] as String;
    discount = json['discount'] as String;
    discountTax = json['discount_tax'] as String;

    if (json['meta_data'] != null) {
      metaData = List<OrderMetaDataModel>.from((json['meta_data'] as List)
          .map((x) => OrderMetaDataModel.fromJson(x as Map<String, dynamic>)));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['discount'] = discount;
    data['discount_tax'] = discountTax;
    if (metaData != null) {
      data['meta_data'] = metaData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderRefundsModel {
  OrderRefundsModel({
    this.id,
    this.reason,
    this.total,
  });
  int id;
  String reason;
  String total;
  OrderRefundsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    reason = json['reason'] as String;
    total = json['total'] as String;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['reason'] = reason;
    data['total'] = total;
    return data;
  }
}

class OrderTaxesModel {
  OrderTaxesModel({
    this.id,
    this.rateCode,
    this.rateId,
    this.label,
    this.compound,
    this.taxTotal,
    this.shippingTaxTotal,
    this.metaData,
  });
  int id;
  String rateCode;
  String rateId;
  String label;
  bool compound;
  String taxTotal;
  String shippingTaxTotal;
  List<OrderMetaDataModel> metaData;
  OrderTaxesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] = id;
    rateCode = json['rate_code'] as String;
    rateId = json['rate_id'] as String;
    label = json['label'] as String;
    compound = json['compound'] as bool;
    taxTotal = json['tax_total'] as String;
    shippingTaxTotal = json['shipping_tax_total'] as String;

    if (json['meta_data'] != null) {
      metaData = List<OrderMetaDataModel>.from((json['meta_data'] as List)
          .map((x) => OrderMetaDataModel.fromJson(x as Map<String, dynamic>)));
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rate_code'] = rateCode;
    data['rate_id'] = rateId;
    data['label'] = label;
    data['compound'] = compound;
    data['tax_total'] = taxTotal;
    data['shipping_tax_total'] = shippingTaxTotal;
    if (metaData != null) {
      data['meta_data'] = metaData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
/*class OrderModel {
  OrderModel({
    this.customerId,
    this.paymentMethod,
    this.paymentMethodTitle,
    this.setPaid,
    this.transactionId,
    this.lineItems,
    this.orderId,
    this.orderNumber,
    this.orderKey,
    this.status,
    this.orderDateCreated,
    this.orderTotal,
  });
  int orderId;
  String orderNumber;
  String orderKey;
  String status;
  DateTime orderDateCreated;
  String orderTotal;
  int customerId;
  BillingModel billing;
  ShippingModel shipping;
  String paymentMethod;
  String paymentMethodTitle;
  String transactionId;
  List<LineItemsModel> lineItems;
  bool setPaid;

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['id'] as int;
    orderNumber = json['number'] as String;
    orderKey = json['order_key'] as String;
    status = json['status'] as String;
    orderDateCreated = DateTime.parse(json['date_created'] as String);
    orderTotal = json['total'] as String;

    customerId = json['customer_id'] as int;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customer_id'] = customerId;
    data['payment_method'] = paymentMethod;
    data['payment_method_title'] = paymentMethodTitle;
    data['set_paid'] = setPaid;
    data['transaction_id'] = transactionId;
    data['shipping'] = shipping.toJson();
    data['billing'] = billing.toJson();
    if (lineItems != null) {
      data['line_items'] = lineItems.map((v) => v.toJson()).toList();
    }
    return data;
  }
}*/

/*class LineItemsModel {
  LineItemsModel({
    this.productId,
    this.variationId,
    this.quantity,
    this.subtotal,
  });
  int productId;
  int variationId;
  int quantity;
  String subtotal;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    if (variationId != null) {
      data['variation_id'] = variationId;
    }
    data['quantity'] = quantity;
    return data;
  }
}*/
