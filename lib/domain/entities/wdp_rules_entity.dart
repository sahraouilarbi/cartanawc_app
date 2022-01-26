class WdpRulesEntity {
  WdpRulesEntity({
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
  WdpRulesOptionsEntity options;
  WdpRulesAdditionalEntity additional;
  List conditions;
  List<WdpRulesFiltersEntity> filters;
  List limits;
  WdpRulesProductAdjustmentsEntity productAdjustments;
  WdpRulesBulkAdjustmentsEntity bulkAdjustments;
  List<String> sortableBlocksPriority;
  List<WdpRulesRoleDiscountsEntity> roleDiscounts;
  List cartAdjustments;
  WdpRulesGetProductsEntity getProducts;
}

// Advanced Dynamic Pricing - options
class WdpRulesOptionsEntity {
  WdpRulesOptionsEntity({
    this.repeat,
    this.applyTo,
  });
  String repeat;
  String applyTo;
}

// Advanced Dynamic Pricing - additional
class WdpRulesAdditionalEntity {
  WdpRulesAdditionalEntity({
    this.replaceName,
    this.sortableApplyMode,
    this.freeProductsReplaceName,
    this.conditionsRelationship,
  });
  String replaceName;
  String sortableApplyMode;
  String freeProductsReplaceName;
  String conditionsRelationship;
}

// Advanced Dynamic Pricing - filters
class WdpRulesFiltersEntity {
  WdpRulesFiltersEntity({
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
}

// Advanced Dynamic Pricing - product_adjustments
class WdpRulesProductAdjustmentsEntity {
  WdpRulesProductAdjustmentsEntity({
    this.split,
    this.maxDiscountSum,
    this.splitDiscountBy,
  });
  WdpRulesProductAdjustmentsTotalEntity total;
  List<WdpRulesProductAdjustmentsSplitEntity> split;
  String maxDiscountSum;
  String splitDiscountBy;
}

// Advanced Dynamic Pricing - product_adjustments -> total
class WdpRulesProductAdjustmentsTotalEntity {
  WdpRulesProductAdjustmentsTotalEntity({
    this.type,
    this.value,
  });
  String type;
  String value;
}

// Advanced Dynamic Pricing - product_adjustments -> split
class WdpRulesProductAdjustmentsSplitEntity {
  WdpRulesProductAdjustmentsSplitEntity({
    this.type,
    this.value,
  });
  String type;
  String value;
}

// Advanced Dynamic Pricing - bulk_adjustments
class WdpRulesBulkAdjustmentsEntity {
  WdpRulesBulkAdjustmentsEntity({
    this.type,
    this.tableMessage,
  });
  String type;
  String tableMessage;
}

// Advanced Dynamic Pricing - role_discounts
class WdpRulesRoleDiscountsEntity {
  WdpRulesRoleDiscountsEntity(
      {this.roles, this.discountType, this.discountValue});
  List<String> roles;
  String discountType;
  String discountValue;
}

// Advanced Dynamic Pricing - get_products
class WdpRulesGetProductsEntity {
  WdpRulesGetProductsEntity({
    this.repeat,
    this.repeatSubtotal,
  });
  String repeat;
  String repeatSubtotal;
}

/* Rearrangement de Advanced Dynamic Pricing
 * le but est de simplicfier la matrice a en avoir juste l'id du produit et
 * les differents prix selon le rôle de l'utilisateur
 */
class CartanaWdpRulesEntity {
  CartanaWdpRulesEntity({this.id, this.cartanaWdpRulesRoles});
  String id;
  List<CartanaWdpRulesRolesEntity> cartanaWdpRulesRoles;
}

class CartanaWdpRulesRolesEntity {
  CartanaWdpRulesRolesEntity({this.roles, this.discountValue});
  String roles;
  String discountValue;
}
