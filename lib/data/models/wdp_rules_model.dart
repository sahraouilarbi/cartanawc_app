class WdpRulesModel {
  WdpRulesModel({
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
  WdpRulesOptionsModel options;
  WdpRulesAdditionalModel additional;
  List conditions;
  List<WdpRulesFiltersModel> filters;
  List limits;
  WdpRulesProductAdjustmentsModel productAdjustments;
  WdpRulesBulkAdjustmentsModel bulkAdjustments;
  List<String> sortableBlocksPriority;
  List<WdpRulesRoleDiscountsModel> roleDiscounts;
  List cartAdjustments;
  WdpRulesGetProductsModel getProducts;

  WdpRulesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    deleted = json['deleted'] as String;
    enabled = json['enabled'] as String;
    exclusive = json['exclusive'] as String;
    type = json['type'] as String;
    title = json['title'] as String;
    priority = json['priority'] as String;

    //options
    if (json['options'] != null) {
      options = WdpRulesOptionsModel.fromJson(
          json['options'] as Map<String, dynamic>);
    }

    //additional
    if (json['additional'] != null) {
      additional = WdpRulesAdditionalModel.fromJson(
          json['additional'] as Map<String, dynamic>);
    }

    //conditions
    conditions = json['conditions'].cast() as List;

    //filters
    if (json['filters'] != null) {
      filters = <WdpRulesFiltersModel>[];
      json['filters'].forEach((v) {
        filters.add(WdpRulesFiltersModel.fromJson(v as Map<String, dynamic>));
      });
    }

    //limits
    limits = json['limits'].cast() as List;

    //product_adjustments
    if (json['product_adjustments'] != null) {
      productAdjustments = WdpRulesProductAdjustmentsModel.fromJson(
          json['product_adjustments'] as Map<String, dynamic>);
    }

    //bulk_adjustments
    if (json['bulk_adjustments'] != null) {
      bulkAdjustments = WdpRulesBulkAdjustmentsModel.fromJson(
          json['bulk_adjustments'] as Map<String, dynamic>);
    }

    //sortable_blocks_priority
    sortableBlocksPriority =
        json['sortable_blocks_priority'].cast<String>() as List<String>;

    //role_discount
    if (json['role_discounts']['rows'] != null) {
      roleDiscounts = <WdpRulesRoleDiscountsModel>[];
      json['role_discounts']['rows'].forEach((v) {
        roleDiscounts.add(
            WdpRulesRoleDiscountsModel.fromJson(v as Map<String, dynamic>));
      });
    }

    //cart_adjustments
    cartAdjustments = json['cart_adjustments'] as List;

    //get_products
    if (json['get_products'] != null) {
      getProducts = WdpRulesGetProductsModel.fromJson(
          json['get_products'] as Map<String, dynamic>);
    }
  }
}

// Advanced Dynamic Pricing - options
class WdpRulesOptionsModel {
  WdpRulesOptionsModel({
    this.repeat,
    this.applyTo,
  });
  String repeat;
  String applyTo;
  WdpRulesOptionsModel.fromJson(Map<String, dynamic> json) {
    repeat = json['repeat'] as String;
    applyTo = json['apply_to'] as String;
  }
}

// Advanced Dynamic Pricing - additional
class WdpRulesAdditionalModel {
  WdpRulesAdditionalModel({
    this.replaceName,
    this.sortableApplyMode,
    this.freeProductsReplaceName,
    this.conditionsRelationship,
  });
  String replaceName;
  String sortableApplyMode;
  String freeProductsReplaceName;
  String conditionsRelationship;
  WdpRulesAdditionalModel.fromJson(Map<String, dynamic> json) {
    replaceName = json['replace_name'] as String;
    sortableApplyMode = json['sortable_apply_mode'] as String;
    freeProductsReplaceName = json['free_products_replace_name'] as String;
    conditionsRelationship = json['conditions_relationship'] as String;
  }
}

// Advanced Dynamic Pricing - filters
class WdpRulesFiltersModel {
  WdpRulesFiltersModel({
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
  WdpRulesFiltersModel.fromJson(Map<String, dynamic> json) {
    qty = json['qty'] as String;
    type = json['type'] as String;
    limitation = json['limitation'] as String;
    method = json['method'] as String;
    value = json['value'].cast<String>() as List<String>;
  }
}

// Advanced Dynamic Pricing - product_adjustments
class WdpRulesProductAdjustmentsModel {
  WdpRulesProductAdjustmentsModel({
    this.split,
    this.maxDiscountSum,
    this.splitDiscountBy,
  });
  WdpRulesProductAdjustmentsTotalModel total;
  List<WdpRulesProductAdjustmentsSplitModel> split;
  String maxDiscountSum;
  String splitDiscountBy;
  WdpRulesProductAdjustmentsModel.fromJson(Map<String, dynamic> json) {
    //total
    if (json['total'] != null) {
      total = WdpRulesProductAdjustmentsTotalModel.fromJson(
          json['total'] as Map<String, dynamic>);
    }

    //split
    if (json['split'] != null) {
      split = <WdpRulesProductAdjustmentsSplitModel>[];
      json['split'].forEach((v) {
        split.add(WdpRulesProductAdjustmentsSplitModel.fromJson(
            v as Map<String, dynamic>));
      });
    }

    maxDiscountSum = json['max_discount_sum'] as String;
    splitDiscountBy = json['split_discount_by'] as String;
  }
}

// Advanced Dynamic Pricing - product_adjustments -> total
class WdpRulesProductAdjustmentsTotalModel {
  WdpRulesProductAdjustmentsTotalModel({
    this.type,
    this.value,
  });
  String type;
  String value;
  WdpRulesProductAdjustmentsTotalModel.fromJson(Map<String, dynamic> json) {
    type = json['type'] as String;
    value = json['value'] as String;
  }
}

// Advanced Dynamic Pricing - product_adjustments -> split
class WdpRulesProductAdjustmentsSplitModel {
  WdpRulesProductAdjustmentsSplitModel({
    this.type,
    this.value,
  });
  String type;
  String value;
  WdpRulesProductAdjustmentsSplitModel.fromJson(Map<String, dynamic> json) {
    type = json['type'] as String;
    value = json['value'] as String;
  }
}

// Advanced Dynamic Pricing - bulk_adjustments
class WdpRulesBulkAdjustmentsModel {
  WdpRulesBulkAdjustmentsModel({
    this.type,
    this.tableMessage,
  });
  String type;
  String tableMessage;
  WdpRulesBulkAdjustmentsModel.fromJson(Map<String, dynamic> json) {
    type = json['type'] as String;
    tableMessage = json['table_message'] as String;
  }
}

// Advanced Dynamic Pricing - role_discounts
class WdpRulesRoleDiscountsModel {
  WdpRulesRoleDiscountsModel(
      {this.roles, this.discountType, this.discountValue});
  List<String> roles;
  String discountType;
  String discountValue;
  WdpRulesRoleDiscountsModel.fromJson(Map<String, dynamic> json) {
    roles = json['roles'].cast<String>() as List<String>;
    discountType = json['discount_type'] as String;
    discountValue = json['discount_value'] as String;
  }
}

// Advanced Dynamic Pricing - get_products
class WdpRulesGetProductsModel {
  WdpRulesGetProductsModel({
    this.repeat,
    this.repeatSubtotal,
  });
  String repeat;
  String repeatSubtotal;
  WdpRulesGetProductsModel.fromJson(Map<String, dynamic> json) {
    repeat = json['repeat'] as String;
    repeatSubtotal = json['repeat_subtotal'] as String;
  }
}

/* Rearrangement de Advanced Dynamic Pricing
 * le but est de simplicfier la matrice a en avoir juste l'id du produit et
 * les differents prix selon le rôle de l'utilisateur
 */
class CartanaWdpRulesModel {
  CartanaWdpRulesModel({this.id, this.cartanaWdpRulesRoles});
  String id;
  List<CartanaWdpRulesRolesModel> cartanaWdpRulesRoles;

  CartanaWdpRulesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
  }
}

class CartanaWdpRulesRolesModel {
  CartanaWdpRulesRolesModel({this.roles, this.discountValue});
  String roles;
  String discountValue;
  CartanaWdpRulesRolesModel.fromJson(Map<String, dynamic> json) {
    roles = json['roles'] as String;
    discountValue = json['discountValue'] as String;
  }
}
