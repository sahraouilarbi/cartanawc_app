class WdpRulesModel {
  String? id;
  String? deleted;
  String? enabled;
  String? exclusive;
  String? type;
  String? title;
  String? priority;
  WdpRulesOptionsModel? options;
  WdpRulesAdditionalModel? additional;
  List<dynamic>? conditions;
  List<WdpRulesFiltersModel>? filters;
  List<dynamic>? limits;
  WdpRulesProductAdjustmentsModel? productAdjustments;
  WdpRulesBulkAdjustmentsModel? bulkAdjustments;
  List<String>? sortableBlocksPriority;
  List<WdpRulesRoleDiscountsModel>? roleDiscounts;
  List<dynamic>? cartAdjustments;
  WdpRulesGetProductsModel? getProducts;

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

  factory WdpRulesModel.fromJson(Map<String, dynamic> json) => WdpRulesModel(
        id: json['id'] != null ? json['id'] as String : null,
        deleted: json['deleted'] != null ? json['deleted'] as String : null,
        enabled: json['enabled'] != null ? json['enabled'] as String : null,
        exclusive:
            json['exclusive'] != null ? json['exclusive'] as String : null,
        type: json['type'] != null ? json['type'] as String : null,
        title: json['title'] != null ? json['title'] as String : null,
        priority: json['priority'] != null ? json['priority'] as String : null,

        //options
        options: json['options'] != null
            ? WdpRulesOptionsModel.fromJson(
                json['options'] as Map<String, dynamic>,
              )
            : null,

        //additional
        additional: json['additional'] != null
            ? WdpRulesAdditionalModel.fromJson(
                json['additional'] as Map<String, dynamic>,
              )
            : null,

        //conditions
        conditions: json['conditions'] != null
            ? List<dynamic>.from(
                (json['conditions'] as List<dynamic>).map((e) => e),
              )
            : [],

        //filters
        filters: json['filters'] != null
            ? List<WdpRulesFiltersModel>.from(
                (json['filters'] as List<dynamic>).map(
                  (e) => WdpRulesFiltersModel.fromJson(
                    e as Map<String, dynamic>,
                  ),
                ),
              )
            : <WdpRulesFiltersModel>[],

        //limits
        limits: json['limits'] != null
            ? List<dynamic>.from(
                (json['limits'] as List<dynamic>).map((e) => e),
              )
            : <dynamic>[],

        //product_adjustments
        productAdjustments: json['product_adjustments'] != null
            ? WdpRulesProductAdjustmentsModel.fromJson(
                json['product_adjustments'] as Map<String, dynamic>,
              )
            : null,

        //bulk_adjustments
        bulkAdjustments: json['bulk_adjustments'] != null
            ? WdpRulesBulkAdjustmentsModel.fromJson(
                json['bulk_adjustments'] as Map<String, dynamic>,
              )
            : null,

        //sortable_blocks_priority
        sortableBlocksPriority: json['sortable_blocks_priority'] != null
            ? List<String>.from(
                (json['sortable_blocks_priority'] as List<dynamic>)
                    .map((e) => e as String),
              )
            : <String>[],

        //role_discount
        roleDiscounts: json['role_discounts']['rows'] != null
            ? List<WdpRulesRoleDiscountsModel>.from(
                (json['role_discounts']['rows'] as List<dynamic>).map(
                  (e) => WdpRulesRoleDiscountsModel.fromJson(
                    e as Map<String, dynamic>,
                  ),
                ),
              )
            : <WdpRulesRoleDiscountsModel>[],

        //cart_adjustments
        cartAdjustments: json['cart_adjustments'] != null
            ? List<dynamic>.from(
                (json['cart_adjustments'] as List<dynamic>).map((e) => e),
              )
            : <dynamic>[],

        //get_products
        getProducts: json['get_products'] != null
            ? WdpRulesGetProductsModel.fromJson(
                json['get_products'] as Map<String, dynamic>,
              )
            : null,
      );
}

// Advanced Dynamic Pricing - options
class WdpRulesOptionsModel {
  String? repeat;
  String? applyTo;

  WdpRulesOptionsModel({
    this.repeat,
    this.applyTo,
  });

  factory WdpRulesOptionsModel.fromJson(Map<String, dynamic> json) =>
      WdpRulesOptionsModel(
        repeat: json['repeat'] != null ? json['repeat'] as String : null,
        applyTo: json['apply_to'] != null ? json['apply_to'] as String : null,
      );
}

// Advanced Dynamic Pricing - additional
class WdpRulesAdditionalModel {
  String? replaceName;
  String? sortableApplyMode;
  String? freeProductsReplaceName;
  String? conditionsRelationship;

  WdpRulesAdditionalModel({
    this.replaceName,
    this.sortableApplyMode,
    this.freeProductsReplaceName,
    this.conditionsRelationship,
  });

  factory WdpRulesAdditionalModel.fromJson(Map<String, dynamic> json) =>
      WdpRulesAdditionalModel(
        replaceName: json['replace_name'] != null
            ? json['replace_name'] as String
            : null,
        sortableApplyMode: json['sortable_apply_mode'] != null
            ? json['sortable_apply_mode'] as String
            : null,
        freeProductsReplaceName: json['free_products_replace_name'] != null
            ? json['free_products_replace_name'] as String
            : null,
        conditionsRelationship: json['conditions_relationship'] != null
            ? json['conditions_relationship'] as String
            : null,
      );
}

// Advanced Dynamic Pricing - filters
class WdpRulesFiltersModel {
  String? qty;
  String? type;
  String? limitation;
  String? method;
  List<String>? value;

  WdpRulesFiltersModel({
    this.qty,
    this.type,
    this.limitation,
    this.method,
    this.value,
  });

  factory WdpRulesFiltersModel.fromJson(Map<String, dynamic> json) =>
      WdpRulesFiltersModel(
        qty: json['qty'] != null ? json['qty'] as String : null,
        type: json['type'] != null ? json['type'] as String : null,
        limitation:
            json['limitation'] != null ? json['limitation'] as String : null,
        method: json['method'] != null ? json['method'] as String : null,
        value: json['value'] != null
            ? List<String>.from((json['value'] as List<dynamic>).map((e) => e))
            : <String>[],
      );
}

// Advanced Dynamic Pricing - product_adjustments
class WdpRulesProductAdjustmentsModel {
  WdpRulesProductAdjustmentsTotalModel? total;
  List<WdpRulesProductAdjustmentsSplitModel>? split;
  String? maxDiscountSum;
  String? splitDiscountBy;

  WdpRulesProductAdjustmentsModel({
    this.total,
    this.split,
    this.maxDiscountSum,
    this.splitDiscountBy,
  });

  factory WdpRulesProductAdjustmentsModel.fromJson(Map<String, dynamic> json) =>
      WdpRulesProductAdjustmentsModel(
        //total
        total: json['total'] != null
            ? WdpRulesProductAdjustmentsTotalModel.fromJson(
                json['total'] as Map<String, dynamic>,
              )
            : null,

        //split
        split: json['split'] != null
            ? List<WdpRulesProductAdjustmentsSplitModel>.from(
                (json['split'] as List<dynamic>).map(
                  (e) => WdpRulesProductAdjustmentsSplitModel.fromJson(
                    e as Map<String, dynamic>,
                  ),
                ),
              )
            : null,

        maxDiscountSum: json['max_discount_sum'] != null
            ? json['max_discount_sum'] as String
            : null,
        splitDiscountBy: json['split_discount_by'] != null
            ? json['split_discount_by'] as String
            : null,
      );
}

// Advanced Dynamic Pricing - product_adjustments -> total
class WdpRulesProductAdjustmentsTotalModel {
  String? type;
  String? value;

  WdpRulesProductAdjustmentsTotalModel({
    this.type,
    this.value,
  });

  factory WdpRulesProductAdjustmentsTotalModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      WdpRulesProductAdjustmentsTotalModel(
        type: json['type'] != null ? json['type'] as String : null,
        value: json['value'] != null ? json['value'] as String : null,
      );
}

// Advanced Dynamic Pricing - product_adjustments -> split
class WdpRulesProductAdjustmentsSplitModel {
  String? type;
  String? value;

  WdpRulesProductAdjustmentsSplitModel({
    this.type,
    this.value,
  });

  factory WdpRulesProductAdjustmentsSplitModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      WdpRulesProductAdjustmentsSplitModel(
        type: json['type'] != null ? json['type'] as String : null,
        value: json['value'] != null ? json['value'] as String : null,
      );
}

// Advanced Dynamic Pricing - bulk_adjustments
class WdpRulesBulkAdjustmentsModel {
  String? type;
  String? tableMessage;

  WdpRulesBulkAdjustmentsModel({
    this.type,
    this.tableMessage,
  });

  factory WdpRulesBulkAdjustmentsModel.fromJson(Map<String, dynamic> json) =>
      WdpRulesBulkAdjustmentsModel(
        type: json['type'] != null ? json['type'] as String : null,
        tableMessage: json['table_message'] != null
            ? json['table_message'] as String
            : null,
      );
}

// Advanced Dynamic Pricing - role_discounts
class WdpRulesRoleDiscountsModel {
  List<String>? roles;
  String? discountType;
  String? discountValue;

  WdpRulesRoleDiscountsModel({
    this.roles,
    this.discountType,
    this.discountValue,
  });

  factory WdpRulesRoleDiscountsModel.fromJson(Map<String, dynamic> json) =>
      WdpRulesRoleDiscountsModel(
        roles: json['roles'] != null
            ? List<String>.from(json['roles'] as List<dynamic>).toList()
            : null,
        discountType: json['discount_type'] != null
            ? json['discount_type'] as String
            : null,
        discountValue: json['discount_value'] != null
            ? json['discount_value'] as String
            : null,
      );
}

// Advanced Dynamic Pricing - get_products
class WdpRulesGetProductsModel {
  String? repeat;
  String? repeatSubtotal;

  WdpRulesGetProductsModel({
    this.repeat,
    this.repeatSubtotal,
  });
  factory WdpRulesGetProductsModel.fromJson(Map<String, dynamic> json) =>
      WdpRulesGetProductsModel(
        repeat: json['repeat'] != null ? json['repeat'] as String : null,
        repeatSubtotal: json['repeat_subtotal'] != null
            ? json['repeat_subtotal'] as String
            : null,
      );
}

/* Rearrangement de Advanced Dynamic Pricing
 * le but est de simplicfier la matrice a en avoir juste l'id du produit et
 * les differents prix selon le rôle de l'utilisateur
 */
class CartanaWdpRulesModel {
  String? id;
  List<CartanaWdpRulesRolesModel>? cartanaWdpRulesRoles;

  CartanaWdpRulesModel({
    this.id,
    this.cartanaWdpRulesRoles,
  });

  factory CartanaWdpRulesModel.fromJson(Map<String, dynamic> json) =>
      CartanaWdpRulesModel(
        id: json['id'] != null ? json['id'] as String : null,
        cartanaWdpRulesRoles: json['roles'] != null
            ? List<CartanaWdpRulesRolesModel>.from(
                (json['roles'] as List<dynamic>).map(
                  (_e) => CartanaWdpRulesRolesModel.fromJson(
                    _e as Map<String, dynamic>,
                  ),
                ),
              )
            : null,
      );
}

class CartanaWdpRulesRolesModel {
  String? roles;
  String? discountValue;

  CartanaWdpRulesRolesModel({
    this.roles,
    this.discountValue,
  });

  factory CartanaWdpRulesRolesModel.fromJson(Map<String, dynamic> json) =>
      CartanaWdpRulesRolesModel(
        roles: json['roles'] != null ? json['roles'] as String : null,
        discountValue: json['discountValue'] != null
            ? json['discountValue'] as String
            : null,
      );
}
