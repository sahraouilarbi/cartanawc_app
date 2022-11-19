class WdpRulesEntity {
  WdpRulesEntity({
    required this.id,
    required this.deleted,
    required this.enabled,
    required this.exclusive,
    required this.type,
    required this.title,
    required this.priority,
    required this.options,
    required this.additional,
    required this.conditions,
    required this.filters,
    required this.limits,
    required this.productAdjustments,
    required this.sortableBlocksPriority,
    required this.bulkAdjustments,
    required this.roleDiscounts,
    required this.cartAdjustments,
    required this.getProducts,
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
    required this.repeat,
    required this.applyTo,
  });
  String repeat;
  String applyTo;
}

// Advanced Dynamic Pricing - additional
class WdpRulesAdditionalEntity {
  WdpRulesAdditionalEntity({
    required this.replaceName,
    required this.sortableApplyMode,
    required this.freeProductsReplaceName,
    required this.conditionsRelationship,
  });
  String replaceName;
  String sortableApplyMode;
  String freeProductsReplaceName;
  String conditionsRelationship;
}

// Advanced Dynamic Pricing - filters
class WdpRulesFiltersEntity {
  WdpRulesFiltersEntity({
    required this.qty,
    required this.type,
    required this.limitation,
    required this.method,
    required this.value,
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
    required this.total,
    required this.split,
    required this.maxDiscountSum,
    required this.splitDiscountBy,
  });
  WdpRulesProductAdjustmentsTotalEntity total;
  List<WdpRulesProductAdjustmentsSplitEntity> split;
  String maxDiscountSum;
  String splitDiscountBy;
}

// Advanced Dynamic Pricing - product_adjustments -> total
class WdpRulesProductAdjustmentsTotalEntity {
  WdpRulesProductAdjustmentsTotalEntity({
    required this.type,
    required this.value,
  });
  String type;
  String value;
}

// Advanced Dynamic Pricing - product_adjustments -> split
class WdpRulesProductAdjustmentsSplitEntity {
  WdpRulesProductAdjustmentsSplitEntity({
    required this.type,
    required this.value,
  });
  String type;
  String value;
}

// Advanced Dynamic Pricing - bulk_adjustments
class WdpRulesBulkAdjustmentsEntity {
  WdpRulesBulkAdjustmentsEntity({
    required this.type,
    required this.tableMessage,
  });
  String type;
  String tableMessage;
}

// Advanced Dynamic Pricing - role_discounts
class WdpRulesRoleDiscountsEntity {
  WdpRulesRoleDiscountsEntity(
      {required this.roles,
      required this.discountType,
      required this.discountValue});
  List<String> roles;
  String discountType;
  String discountValue;
}

// Advanced Dynamic Pricing - get_products
class WdpRulesGetProductsEntity {
  WdpRulesGetProductsEntity({
    required this.repeat,
    required this.repeatSubtotal,
  });
  String repeat;
  String repeatSubtotal;
}

/* Rearrangement de Advanced Dynamic Pricing
 * le but est de simplicfier la matrice a en avoir juste l'id du produit et
 * les differents prix selon le rôle de l'utilisateur
 */
class CartanaWdpRulesEntity {
  CartanaWdpRulesEntity({required this.id, required this.cartanaWdpRulesRoles});
  String id;
  List<CartanaWdpRulesRolesEntity> cartanaWdpRulesRoles;
}

class CartanaWdpRulesRolesEntity {
  CartanaWdpRulesRolesEntity(
      {required this.roles, required this.discountValue});
  String roles;
  String discountValue;
}
