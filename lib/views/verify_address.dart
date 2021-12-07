import 'package:cartanawc_app/models/customer_detail_model.dart';
import 'package:cartanawc_app/views/checkout_base.dart';
import 'package:cartanawc_app/views/payment_methods.dart';
import 'package:cartanawc_app/model_views/providers/cart_provider.dart';
import 'package:cartanawc_app/utils/form_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerifyAddress extends CheckoutBasePage {
  @override
  _VerifyAddressState createState() => _VerifyAddressState();
}

class _VerifyAddressState extends CheckoutBasePageState<VerifyAddress> {
  @override
  void initState() {
    super.initState();
    currentPage = 0;
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.fetchShippingDetails();
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
        padding: const EdgeInsets.all(10.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Adresse de livraison : ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: FormHelper.fieldLabel('Nom:'),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: FormHelper.fieldLabel('Prénom:'),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: FormHelper.fieldLabelValue(context, model.firstName),
                  ),
                  const SizedBox(width: 5.0),
                  Flexible(
                    fit: FlexFit.tight,
                    child: FormHelper.fieldLabelValue(context, model.lastName),
                  ),
                ],
              ),
              FormHelper.fieldLabel('Adresse'),
              FormHelper.fieldLabelValue(context, model.shipping.address1),
              const SizedBox(height: 5.0),
              FormHelper.fieldLabel("Complement d'adresse."),
              FormHelper.fieldLabelValue(context, model.shipping.address2),
              const SizedBox(height: 5.0),
              Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: FormHelper.fieldLabel('Wilaya'),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: FormHelper.fieldLabel('Code postal'),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: FormHelper.fieldLabelValue(
                        context, model.shipping.city),
                  ),
                  const SizedBox(width: 5.0),
                  Flexible(
                    fit: FlexFit.tight,
                    child: FormHelper.fieldLabelValue(
                        context, model.shipping.postcode),
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(height: 20.0),
              const Text(
                'Adresse de facturation : ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: FormHelper.fieldLabel('Nom:'),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: FormHelper.fieldLabel('Prénom:'),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: FormHelper.fieldLabelValue(context, model.firstName),
                  ),
                  const SizedBox(width: 5.0),
                  Flexible(
                    fit: FlexFit.tight,
                    child: FormHelper.fieldLabelValue(context, model.lastName),
                  ),
                ],
              ),
              FormHelper.fieldLabel('Adresse'),
              FormHelper.fieldLabelValue(context, model.billing.address1),
              const SizedBox(height: 5.0),
              FormHelper.fieldLabel("Complement d'adresse."),
              FormHelper.fieldLabelValue(context, model.billing.address2),
              const SizedBox(height: 5.0),
              Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: FormHelper.fieldLabel('Wilaya'),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: FormHelper.fieldLabel('Code postal'),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child:
                        FormHelper.fieldLabelValue(context, model.billing.city),
                  ),
                  const SizedBox(width: 5.0),
                  Flexible(
                    fit: FlexFit.tight,
                    child: FormHelper.fieldLabelValue(
                        context, model.billing.postcode),
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(height: 20.0),
              Center(
                child: FormHelper.saveButton(
                  'Suivant',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentMethods(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}