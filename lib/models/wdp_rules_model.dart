class WdpRules {
  WdpRules({
    this.id,
    this.deleted,
    this.enabled,
    this.exclusive,
    this.type,
    this.title,
    this.priority,
    this.options,
    this.additional,
    this.conditions,
    this.filters,
    this.limits,
    this.productAdjustments,
    this.sortableBlocksPriority,
    this.bulkAdjustments,
    this.roleDiscounts,
    this.cartAdjustments,
    this.getProducts,
  });

  String id;
  String deleted;
  String enabled;
  String exclusive;
  String type;
  String title;
  String priority;
  WdpRulesOptions options;
  WdpRulesAdditional additional;
  List conditions;
  List<WdpRulesFilters> filters;
  List limits;
  WdpRulesProductAdjustments productAdjustments;
  WdpRulesBulkAdjustments bulkAdjustments;
  List<String> sortableBlocksPriority;
  List<WdpRulesRoleDiscounts> roleDiscounts;
  List cartAdjustments;
  WdpRulesGetProducts getProducts;

  WdpRules.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    deleted = json['deleted'] as String;
    enabled = json['enabled'] as String;
    exclusive = json['exclusive'] as String;
    type = json['type'] as String;
    title = json['title'] as String;
    priority = json['priority'] as String;

    //options
    json['options'] != null
        ? options =
            WdpRulesOptions.fromJson(json['options'] as Map<String, dynamic>)
        : null;

    //additional
    json['additional'] != null
        ? additional = WdpRulesAdditional.fromJson(
            json['additional'] as Map<String, dynamic>)
        : null;

    //conditions
    conditions = json['conditions'].cast() as List;

    //filters
    if (json['filters'] != null) {
      filters = <WdpRulesFilters>[];
      json['filters'].forEach((v) {
        filters.add(WdpRulesFilters.fromJson(v as Map<String, dynamic>));
      });
    }

    //limits
    limits = json['limits'].cast() as List;

    //product_adjustments
    json['product_adjustments'] != null
        ? productAdjustments = WdpRulesProductAdjustments.fromJson(
            json['product_adjustments'] as Map<String, dynamic>)
        : null;

    //bulk_adjustments
    json['bulk_adjustments'] != null
        ? bulkAdjustments = WdpRulesBulkAdjustments.fromJson(
            json['bulk_adjustments'] as Map<String, dynamic>)
        : null;

    //sortable_blocks_priority
    sortableBlocksPriority =
        json['sortable_blocks_priority'].cast<String>() as List<String>;

    //role_discount
    if (json['role_discounts']['rows'] != null) {
      roleDiscounts = <WdpRulesRoleDiscounts>[];
      json['role_discounts']['rows'].forEach((v) {
        roleDiscounts
            .add(WdpRulesRoleDiscounts.fromJson(v as Map<String, dynamic>));
      });
    }

    //cart_adjustments
    cartAdjustments = json['cart_adjustments'] as List;

    //get_products
    json['get_products'] != null
        ? getProducts = WdpRulesGetProducts.fromJson(
            json['get_products'] as Map<String, dynamic>)
        : null;
  }
}

// Advanced Dynamic Pricing - options
class WdpRulesOptions {
  WdpRulesOptions({
    this.repeat,
    this.applyTo,
  });
  String repeat;
  String applyTo;
  WdpRulesOptions.fromJson(Map<String, dynamic> json) {
    repeat = json['repeat'] as String;
    applyTo = json['apply_to'] as String;
  }
}

// Advanced Dynamic Pricing - additional
class WdpRulesAdditional {
  WdpRulesAdditional({
    this.replaceName,
    this.sortableApplyMode,
    this.freeProductsReplaceName,
    this.conditionsRelationship,
  });
  String replaceName;
  String sortableApplyMode;
  String freeProductsReplaceName;
  String conditionsRelationship;
  WdpRulesAdditional.fromJson(Map<String, dynamic> json) {
    replaceName = json['replace_name'] as String;
    sortableApplyMode = json['sortable_apply_mode'] as String;
    freeProductsReplaceName = json['free_products_replace_name'] as String;
    conditionsRelationship = json['conditions_relationship'] as String;
  }
}

// Advanced Dynamic Pricing - filters
class WdpRulesFilters {
  WdpRulesFilters({
    this.qty,
    this.type,
    this.limitation,
    this.method,
    this.value,
  });
  String qty;
  String type;
  String limitation;
  String method;
  List<String> value;
  WdpRulesFilters.fromJson(Map<String, dynamic> json) {
    qty = json['qty'] as String;
    type = json['type'] as String;
    limitation = json['limitation'] as String;
    method = json['method'] as String;
    value = json['value'].cast<String>() as List<String>;
  }
}

// Advanced Dynamic Pricing - product_adjustments
class WdpRulesProductAdjustments {
  WdpRulesProductAdjustments({
    this.split,
    this.maxDiscountSum,
    this.splitDiscountBy,
  });
  WdpRulesProductAdjustmentsTotal total;
  List<WdpRulesProductAdjustmentsSplit> split;
  String maxDiscountSum;
  String splitDiscountBy;
  WdpRulesProductAdjustments.fromJson(Map<String, dynamic> json) {
    //total
    json['total'] != null
        ? total = WdpRulesProductAdjustmentsTotal.fromJson(
            json['total'] as Map<String, dynamic>)
        : null;

    //split
    if (json['split'] != null) {
      split = <WdpRulesProductAdjustmentsSplit>[];
      json['split'].forEach((v) {
        split.add(WdpRulesProductAdjustmentsSplit.fromJson(
            v as Map<String, dynamic>));
      });
    }

    maxDiscountSum = json['max_discount_sum'] as String;
    splitDiscountBy = json['split_discount_by'] as String;
  }
}

// Advanced Dynamic Pricing - product_adjustments -> total
class WdpRulesProductAdjustmentsTotal {
  WdpRulesProductAdjustmentsTotal({
    this.type,
    this.value,
  });
  String type;
  String value;
  WdpRulesProductAdjustmentsTotal.fromJson(Map<String, dynamic> json) {
    type = json['type'] as String;
    value = json['value'] as String;
  }
}

// Advanced Dynamic Pricing - product_adjustments -> split
class WdpRulesProductAdjustmentsSplit {
  WdpRulesProductAdjustmentsSplit({
    this.type,
    this.value,
  });
  String type;
  String value;
  WdpRulesProductAdjustmentsSplit.fromJson(Map<String, dynamic> json) {
    type = json['type'] as String;
    value = json['value'] as String;
  }
}

// Advanced Dynamic Pricing - bulk_adjustments
class WdpRulesBulkAdjustments {
  WdpRulesBulkAdjustments({
    this.type,
    this.tableMessage,
  });
  String type;
  String tableMessage;
  WdpRulesBulkAdjustments.fromJson(Map<String, dynamic> json) {
    type = json['type'] as String;
    tableMessage = json['table_message'] as String;
  }
}

// Advanced Dynamic Pricing - role_discounts
class WdpRulesRoleDiscounts {
  WdpRulesRoleDiscounts({this.roles, this.discountType, this.discountValue});
  List<String> roles;
  String discountType;
  String discountValue;
  WdpRulesRoleDiscounts.fromJson(Map<String, dynamic> json) {
    roles = json['roles'].cast<String>() as List<String>;
    discountType = json['discount_type'] as String;
    discountValue = json['discount_value'] as String;
  }
}

// Advanced Dynamic Pricing - get_products
class WdpRulesGetProducts {
  WdpRulesGetProducts({
    this.repeat,
    this.repeatSubtotal,
  });
  String repeat;
  String repeatSubtotal;
  WdpRulesGetProducts.fromJson(Map<String, dynamic> json) {
    repeat = json['repeat'] as String;
    repeatSubtotal = json['repeat_subtotal'] as String;
  }
}

/* Rearrangement de Advanced Dynamic Pricing
 * le but est de simplicfier la matrice a en avoir juste l'id du produit et
 * les differents prix selon le rôle de l'utilisateur
 */
class CartanaWdpRules {
  CartanaWdpRules({this.id, this.cartanaWdpRulesRoles});
  String id;
  List<CartanaWdpRulesRoles> cartanaWdpRulesRoles;

  CartanaWdpRules.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
  }
}

class CartanaWdpRulesRoles {
  CartanaWdpRulesRoles({this.roles, this.discountValue});
  String roles;
  String discountValue;
  CartanaWdpRulesRoles.fromJson(Map<String, dynamic> json) {
    roles = json['roles'] as String;
    discountValue = json['discountValue'] as String;
  }
}
