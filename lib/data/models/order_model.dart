import 'package:cartanawc_app/data/models/billing_model.dart';
import 'package:cartanawc_app/data/models/shipping_model.dart';

class OrderModel {
  OrderModel({
    this.id,
    this.parent_id,
    this.number,
    this.order_key,
    this.created_via,
    this.version,
    this.status,
    this.currency,
    this.date_created,
    this.date_created_gmt,
    this.date_modified,
    this.date_modified_gmt,
    this.discount_total,
    this.discount_tax,
    this.shipping_total,
    this.shipping_tax,
    this.cart_tax,
    this.total,
    this.total_tax,
    this.prices_include_tax,
    this.customer_id,
    this.customer_ip_address,
    this.customer_user_agent,
    this.customer_note,
    this.billing,
    this.shipping,
    this.payment_method,
    this.payment_method_title,
    this.transaction_id,
    this.date_paid,
    this.date_paid_gmt,
    this.date_completed,
    this.date_completed_gmt,
    this.cart_hash,
    this.meta_data,
    this.line_items,
    this.tax_lines,
    this.shipping_lines,
    this.fee_lines,
    this.coupon_lines,
    this.refunds,
    this.set_paid,
  });
  int id;
  int parent_id;
  String number;
  String order_key;
  String created_via;
  String version;
  String status;
  String currency;
  DateTime date_created;
  DateTime date_created_gmt;
  DateTime date_modified;
  DateTime date_modified_gmt;
  String discount_total;
  String discount_tax;
  String shipping_total;
  String shipping_tax;
  String cart_tax;
  String total;
  String total_tax;
  bool prices_include_tax;
  int customer_id;
  String customer_ip_address;
  String customer_user_agent;
  String customer_note;
  BillingModel billing;
  ShippingModel shipping;
  String payment_method;
  String payment_method_title;
  String transaction_id;
  DateTime date_paid;
  DateTime date_paid_gmt;
  DateTime date_completed;
  DateTime date_completed_gmt;
  String cart_hash;
  List<OrderMetaDataModel> meta_data;
  List<OrderLineItemsModel> line_items;
  List<OrderTaxLinesModel> tax_lines;
  List<OrderShippingLinesModel> shipping_lines;
  List<OrderFeeLinesModel> fee_lines;
  List<OrderCouponLinesModel> coupon_lines;
  List<OrderRefundsModel> refunds;
  bool set_paid;
  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    parent_id = json['parent_id'] as int;
    number = json['number'] as String;
    order_key = json['order_key'] as String;
    created_via = json['created_via'] as String;
    version = json['version'] as String;
    status = json['status'] as String;
    currency = json['currency'] as String;
    date_created = json['date_created'] as DateTime;
    date_created_gmt = json['date_created_gmt'] as DateTime;
    date_modified = json['date_modified'] as DateTime;
    date_modified_gmt = json['date_modified_gmt'] as DateTime;
    discount_total = json['discount_total'] as String;
    discount_tax = json['discount_tax'] as String;
    shipping_total = json['shipping_total'] as String;
    shipping_tax = json['shipping_tax'] as String;
    cart_tax = json['cart_tax'] as String;
    total = json['total'] as String;
    total_tax = json['total_tax'] as String;
    prices_include_tax = json['prices_include_tax'] as bool;
    customer_id = json['customer_id'] as int;
    customer_ip_address = json['customer_ip_address'] as String;
    customer_user_agent = json['customer_user_agent'] as String;
    customer_note = json['customer_note'] as String;
    billing = json['billing'] as BillingModel;
    shipping = json['shipping'] as ShippingModel;
    payment_method = json['payment_method'] as String;
    payment_method_title = json['payment_method_title'] as String;
    transaction_id = json['transaction_id'] as String;
    date_paid = json['date_paid'] as DateTime;
    date_paid_gmt = json['date_paid_gmt'] as DateTime;
    date_completed = json['date_completed'] as DateTime;
    date_completed_gmt = json['date_completed_gmt'] as DateTime;
    cart_hash = json['cart_hash'] as String;

    if (json['meta_data'] != null) {
      meta_data = List<OrderMetaDataModel>.from((json['meta_data'] as List)
          .map((x) => OrderMetaDataModel.fromJson(x as Map<String, dynamic>)));
    }

    if (json['line_items'] != null) {
      line_items = List<OrderLineItemsModel>.from((json['line_items'] as List)
          .map((x) => OrderLineItemsModel.fromJson(x as Map<String, dynamic>)));
    }

    if (json['tax_lines'] != null) {
      tax_lines = List<OrderTaxLinesModel>.from((json['tax_lines'] as List)
          .map((x) => OrderTaxLinesModel.fromJson(x as Map<String, dynamic>)));
    }

    if (json['shipping_lines'] != null) {
      shipping_lines = List<OrderShippingLinesModel>.from(
          (json['shipping_lines'] as List).map((x) =>
              OrderShippingLinesModel.fromJson(x as Map<String, dynamic>)));
    }

    if (json['fee_lines'] != null) {
      fee_lines = List<OrderFeeLinesModel>.from((json['fee_lines'] as List)
          .map((x) => OrderFeeLinesModel.fromJson(x as Map<String, dynamic>)));
    }

    if (json['coupon_lines'] != null) {
      coupon_lines = List<OrderCouponLinesModel>.from(
          (json['coupon_lines'] as List).map((x) =>
              OrderCouponLinesModel.fromJson(x as Map<String, dynamic>)));
    }

    if (json['refunds'] != null) {
      refunds = List<OrderRefundsModel>.from((json['refunds'] as List)
          .map((x) => OrderRefundsModel.fromJson(x as Map<String, dynamic>)));
    }

    set_paid = json['set_paid'] as bool;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['parent_id'] = parent_id;
    data['number'] = number;
    data['order_key'] = order_key;
    data['created_via'] = created_via;
    data['version'] = version;
    data['status'] = status;
    data['currency'] = currency;
    data['date_created'] = date_created;
    data['date_created_gmt'] = date_created_gmt;
    data['date_modified'] = date_modified;
    data['date_modified_gmt'] = date_modified_gmt;
    data['discount_total'] = discount_total;
    data['discount_tax'] = discount_tax;
    data['shipping_total'] = shipping_total;
    data['shipping_tax'] = shipping_tax;
    data['cart_tax'] = cart_tax;
    data['total'] = total;
    data['total_tax'] = total_tax;
    data['prices_include_tax'] = prices_include_tax;
    data['customer_id'] = customer_id;
    data['customer_ip_address'] = customer_ip_address;
    data['customer_user_agent'] = customer_user_agent;
    data['customer_note'] = customer_note;
    data['billing'] = billing;
    data['shipping'] = shipping;
    data['payment_method'] = payment_method;
    data['payment_method_title'] = payment_method_title;
    data['transaction_id'] = transaction_id;
    data['date_paid'] = date_paid;
    data['date_paid_gmt'] = date_paid_gmt;
    data['date_completed'] = date_completed;
    data['date_completed_gmt'] = date_completed_gmt;
    data['cart_hash'] = cart_hash;

    if (meta_data != null) {
      data['meta_data'] = meta_data.map((v) => v.toJson()).toList();
    }

    if (line_items != null) {
      data['line_items'] = line_items.map((v) => v.toJson()).toList();
    }

    if (tax_lines != null) {
      data['tax_lines'] = tax_lines.map((v) => v.toJson()).toList();
    }

    if (shipping_lines != null) {
      data['shipping_lines'] = shipping_lines.map((v) => v.toJson()).toList();
    }

    if (fee_lines != null) {
      data['fee_lines'] = fee_lines.map((v) => v.toJson()).toList();
    }

    if (coupon_lines != null) {
      data['coupon_lines'] = coupon_lines.map((v) => v.toJson()).toList();
    }

    if (refunds != null) {
      data['refunds'] = refunds.map((v) => v.toJson()).toList();
    }

    data['set_paid'] = set_paid;

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
    this.product_id,
    this.variation_id,
    this.quantity,
    this.tax_class,
    this.subtotal,
    this.subtotal_tax,
    this.total,
    this.total_tax,
    this.taxes,
    this.meta_data,
    this.sku,
    this.price,
  });
  int id;
  String name;
  int product_id;
  int variation_id;
  int quantity;
  String tax_class;
  String subtotal;
  String subtotal_tax;
  String total;
  String total_tax;
  List<OrderTaxesModel> taxes;
  List<OrderMetaDataModel> meta_data;
  String sku;
  String price;
  OrderLineItemsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'] as String;
    product_id = json['product_id'] as int;
    variation_id = json['variation_id'] as int;
    quantity = json['quantity'] as int;
    tax_class = json['tax_class'] as String;
    subtotal = json['subtotal'] as String;
    subtotal_tax = json['subtotal_tax'] as String;
    total = json['total'] as String;
    total_tax = json['total_tax'] as String;

    if (json['taxes'] != null) {
      taxes = List<OrderTaxesModel>.from((json['taxes'] as List)
          .map((x) => OrderTaxesModel.fromJson(x as Map<String, dynamic>)));
    }

    if (json['meta_data'] != null) {
      meta_data = List<OrderMetaDataModel>.from((json['meta_data'] as List)
          .map((x) => OrderMetaDataModel.fromJson(x as Map<String, dynamic>)));
    }

    sku = json['sku'] as String;
    price = json['price'] as String;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['product_id'] = product_id;
    data['variation_id'] = variation_id;
    data['quantity'] = quantity;
    data['tax_class'] = tax_class;
    data['subtotal'] = subtotal;
    data['subtotal_tax'] = subtotal_tax;
    data['total'] = total;
    data['total_tax'] = total_tax;

    if (taxes != null) {
      data['taxes'] = taxes.map((v) => v.toJson()).toList();
    }

    if (meta_data != null) {
      data['meta_data'] = meta_data.map((v) => v.toJson()).toList();
    }

    data['sku'] = sku;
    data['price'] = price;
    return data;
  }
}

class OrderTaxLinesModel {
  OrderTaxLinesModel({
    this.id,
    this.rate_code,
    this.rate_id,
    this.label,
    this.compound,
    this.tax_total,
    this.shipping_tax_total,
    this.meta_data,
  });
  int id;
  String rate_code;
  String rate_id;
  String label;
  bool compound;
  String tax_total;
  String shipping_tax_total;
  List<OrderMetaDataModel> meta_data;
  OrderTaxLinesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] = id;
    rate_code = json['rate_code'] as String;
    rate_id = json['rate_id'] as String;
    label = json['label'] as String;
    compound = json['compound'] as bool;
    tax_total = json['tax_total'] as String;
    shipping_tax_total = json['shipping_tax_total'] as String;

    if (json['meta_data'] != null) {
      meta_data = List<OrderMetaDataModel>.from((json['meta_data'] as List)
          .map((x) => OrderMetaDataModel.fromJson(x as Map<String, dynamic>)));
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rate_code'] = rate_code;
    data['rate_id'] = rate_id;
    data['label'] = label;
    data['compound'] = compound;
    data['tax_total'] = tax_total;
    data['shipping_tax_total'] = shipping_tax_total;

    if (meta_data != null) {
      data['meta_data'] = meta_data.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class OrderShippingLinesModel {
  OrderShippingLinesModel({
    this.id,
    this.method_title,
    this.method_id,
    this.total,
    this.total_tax,
    this.taxes,
    this.meta_data,
  });

  int id;
  String method_title;
  String method_id;
  String total;
  String total_tax;
  List<OrderTaxesModel> taxes;
  List<OrderMetaDataModel> meta_data;
  OrderShippingLinesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    method_title = json['method_title'] as String;
    method_id = json['method_id'] as String;
    total = json['total'] as String;
    total_tax = json['total_tax'] as String;
    if (json['taxes'] != null) {
      taxes = List<OrderTaxesModel>.from((json['taxes'] as List)
          .map((x) => OrderTaxesModel.fromJson(x as Map<String, dynamic>)));
    }
    if (json['meta_data'] != null) {
      meta_data = List<OrderMetaDataModel>.from((json['meta_data'] as List)
          .map((x) => OrderMetaDataModel.fromJson(x as Map<String, dynamic>)));
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['method_title'] = method_title;
    data['method_id'] = method_id;
    data['total'] = total;
    data['total_tax'] = total_tax;
    if (taxes != null) {
      data['taxes'] = taxes.map((v) => v.toJson()).toList();
    }
    if (meta_data != null) {
      data['meta_data'] = meta_data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderFeeLinesModel {
  OrderFeeLinesModel({
    this.id,
    this.name,
    this.tax_class,
    this.tax_status,
    this.total,
    this.total_tax,
    this.taxes,
    this.meta_data,
  });

  int id;
  String name;
  String tax_class;
  String tax_status;
  String total;
  String total_tax;
  List<OrderTaxesModel> taxes;
  List<OrderMetaDataModel> meta_data;
  OrderFeeLinesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'] as String;
    tax_class = json['tax_class'] as String;
    tax_status = json['tax_status'] as String;
    total = json['total'] as String;
    total_tax = json['total_tax'] as String;

    if (json['taxes'] != null) {
      taxes = List<OrderTaxesModel>.from((json['taxes'] as List)
          .map((x) => OrderTaxesModel.fromJson(x as Map<String, dynamic>)));
    }
    if (json['meta_data'] != null) {
      meta_data = List<OrderMetaDataModel>.from((json['meta_data'] as List)
          .map((x) => OrderMetaDataModel.fromJson(x as Map<String, dynamic>)));
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['tax_class'] = tax_class;
    data['tax_status'] = tax_status;
    data['total'] = total;
    data['total_tax'] = total_tax;
    if (taxes != null) {
      data['taxes'] = taxes.map((v) => v.toJson()).toList();
    }
    if (meta_data != null) {
      data['meta_data'] = meta_data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderCouponLinesModel {
  OrderCouponLinesModel({
    this.id,
    this.code,
    this.discount,
    this.discount_tax,
    this.meta_data,
  });
  int id;
  String code;
  String discount;
  String discount_tax;
  List<OrderMetaDataModel> meta_data;

  OrderCouponLinesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    code = json['code'] as String;
    discount = json['discount'] as String;
    discount_tax = json['discount_tax'] as String;

    if (json['meta_data'] != null) {
      meta_data = List<OrderMetaDataModel>.from((json['meta_data'] as List)
          .map((x) => OrderMetaDataModel.fromJson(x as Map<String, dynamic>)));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['discount'] = discount;
    data['discount_tax'] = discount_tax;
    if (meta_data != null) {
      data['meta_data'] = meta_data.map((v) => v.toJson()).toList();
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
    this.rate_code,
    this.rate_id,
    this.label,
    this.compound,
    this.tax_total,
    this.shipping_tax_total,
    this.meta_data,
  });
  int id;
  String rate_code;
  String rate_id;
  String label;
  bool compound;
  String tax_total;
  String shipping_tax_total;
  List<OrderMetaDataModel> meta_data;
  OrderTaxesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] = id;
    rate_code = json['rate_code'] as String;
    rate_id = json['rate_id'] as String;
    label = json['label'] as String;
    compound = json['compound'] as bool;
    tax_total = json['tax_total'] as String;
    shipping_tax_total = json['shipping_tax_total'] as String;

    if (json['meta_data'] != null) {
      meta_data = List<OrderMetaDataModel>.from((json['meta_data'] as List)
          .map((x) => OrderMetaDataModel.fromJson(x as Map<String, dynamic>)));
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rate_code'] = rate_code;
    data['rate_id'] = rate_id;
    data['label'] = label;
    data['compound'] = compound;
    data['tax_total'] = tax_total;
    data['shipping_tax_total'] = shipping_tax_total;
    if (meta_data != null) {
      data['meta_data'] = meta_data.map((v) => v.toJson()).toList();
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
