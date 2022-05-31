import 'package:cartanawc_app/model_views/providers/cart_provider.dart';
import 'package:cartanawc_app/presentation/base/base_checkout.dart';
import 'package:cartanawc_app/presentation/common/my_text_buttom_widget.dart';
import 'package:cartanawc_app/presentation/common/my_text_form_field_widget.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/presentation/ressources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/data/models/models.dart';
import '/presentation/pages.dart';

class VerifyAddress extends CheckoutBasePage {
  @override
  _VerifyAddressState createState() => _VerifyAddressState();
}

class _VerifyAddressState extends CheckoutBasePageState<VerifyAddress> {
  final TextEditingController _shippingFirstNameTextEditingController =
      TextEditingController();
  final TextEditingController _shippingLastNameTextEditingController =
      TextEditingController();
  final TextEditingController _shippingAddress1TextEditingController =
      TextEditingController();
  final TextEditingController _shippingAddress2TextEditingController =
      TextEditingController();
  final TextEditingController _shippingCityEditingController =
      TextEditingController();
  final TextEditingController _shippingPostcodeTextEditingController =
      TextEditingController();
  final TextEditingController _billingFirstNameTextEditingController =
      TextEditingController();
  final TextEditingController _billingLastNameTextEditingController =
      TextEditingController();
  final TextEditingController _billingAddress1TextEditingController =
      TextEditingController();
  final TextEditingController _billingAddress2TextEditingController =
      TextEditingController();
  final TextEditingController _billingCityEditingController =
      TextEditingController();
  final TextEditingController _billingPostcodeTextEditingController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    currentPage = 0;
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.fetchShippingDetails();
  }

  @override
  void dispose() {
    super.dispose();
    _shippingFirstNameTextEditingController.dispose();
    _shippingLastNameTextEditingController.dispose();
    _shippingAddress1TextEditingController.dispose();
    _shippingAddress2TextEditingController.dispose();
    _shippingCityEditingController.dispose();
    _shippingPostcodeTextEditingController.dispose();
    _billingFirstNameTextEditingController.dispose();
    _billingLastNameTextEditingController.dispose();
    _billingAddress1TextEditingController.dispose();
    _billingAddress2TextEditingController.dispose();
    _billingCityEditingController.dispose();
    _billingPostcodeTextEditingController.dispose();
  }

  @override
  Widget pageUI() {
    return Consumer<CartProvider>(builder: (context, customerModel, child) {
      if (customerModel.customerDetailModel.id != null) {
        return _formUI(customerModel.customerDetailModel);
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }

  Widget _formUI(CustomerDetailModel model) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p10),
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Adresse de livraison : ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              const SizedBox(height: AppSize.s20),
              Row(
                children: [
                  //Nom
                  Flexible(
                    fit: FlexFit.tight,
                    child: MyTextFormFieldWidget(
                      controller: _shippingFirstNameTextEditingController
                        ..text = model.shipping.firstName,
                      labelText: 'Nom',
                      readOnly: true,
                    ),
                  ),

                  const SizedBox(width: AppSize.s5),

                  // Prénom
                  Flexible(
                    fit: FlexFit.tight,
                    child: MyTextFormFieldWidget(
                      controller: _shippingLastNameTextEditingController
                        ..text = model.shipping.lastName,
                      labelText: 'Prénom',
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s20),
              MyTextFormFieldWidget(
                controller: _shippingAddress1TextEditingController
                  ..text = model.shipping.address1,
                labelText: 'Adresse',
                readOnly: true,
              ),
              const SizedBox(height: AppSize.s20),
              MyTextFormFieldWidget(
                controller: _shippingAddress2TextEditingController
                  ..text = model.shipping.address2,
                labelText: "Complement d'adresse",
                readOnly: true,
              ),
              const SizedBox(height: AppSize.s20),
              Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: MyTextFormFieldWidget(
                      controller: _shippingCityEditingController
                        ..text = model.shipping.city,
                      labelText: 'Wilaya',
                      readOnly: true,
                    ),
                  ),
                  const SizedBox(width: AppSize.s5),
                  Flexible(
                    fit: FlexFit.tight,
                    child: MyTextFormFieldWidget(
                      controller: _shippingPostcodeTextEditingController
                        ..text = model.shipping.postcode,
                      labelText: 'Code postal',
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              const Divider(height: AppSize.s60),
              const Text(
                'Adresse de facturation : ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              const SizedBox(height: AppSize.s20),
              Row(
                children: [
                  //Nom
                  Flexible(
                    fit: FlexFit.tight,
                    child: MyTextFormFieldWidget(
                      controller: _billingFirstNameTextEditingController
                        ..text = model.billing.firstName,
                      labelText: 'Nom',
                      readOnly: true,
                    ),
                  ),

                  const SizedBox(width: AppSize.s5),

                  // Prénom
                  Flexible(
                    fit: FlexFit.tight,
                    //child: FormHelper.fieldLabel('Prénom:'),
                    child: MyTextFormFieldWidget(
                      controller: _billingLastNameTextEditingController
                        ..text = model.billing.lastName,
                      labelText: 'Prénom',
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s20),
              MyTextFormFieldWidget(
                controller: _billingAddress1TextEditingController
                  ..text = model.billing.address1,
                labelText: 'Adresse',
                readOnly: true,
              ),
              const SizedBox(height: AppSize.s20),
              MyTextFormFieldWidget(
                controller: _billingAddress2TextEditingController
                  ..text = model.billing.address2,
                labelText: "Complement d'adresse",
                readOnly: true,
              ),
              const SizedBox(height: AppSize.s20),
              Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: MyTextFormFieldWidget(
                      controller: _billingCityEditingController
                        ..text = model.billing.city,
                      labelText: 'Wilaya',
                      readOnly: true,
                    ),
                  ),
                  const SizedBox(width: AppSize.s5),
                  Flexible(
                    fit: FlexFit.tight,
                    child: MyTextFormFieldWidget(
                      controller: _billingPostcodeTextEditingController
                        ..text = model.billing.postcode,
                      labelText: 'Code postal',
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              const Divider(height: AppSize.s60),
              MyTextButtonWidget(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentMethods(),
                    ),
                  );
                },
                backgroundColor: ColorManager.greenAccent,
                textButton: 'SUIVANT',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
