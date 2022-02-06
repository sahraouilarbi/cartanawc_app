import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/data/api/api_service.dart';
import 'package:cartanawc_app/data/models/payment_method_model.dart';
import 'package:cartanawc_app/presentation/checkout/checkout_base.dart';
import 'package:cartanawc_app/model_views/providers/cart_provider.dart';
import 'package:cartanawc_app/presentation/common/form_helper.dart';
import 'package:cartanawc_app/presentation/order/order_success_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentMethods extends CheckoutBasePage {
  @override
  _PaymentMethodsState createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends CheckoutBasePageState<PaymentMethods> {
  APIService apiService;
  Future<List<PaymentGatewaysModel>> paymentGateways;
  String _paymentGatewaysID = '';
  CartProvider cartProvider;

  @override
  void initState() {
    super.initState();
    currentPage = 1;
    apiService = APIService();
    cartProvider = Provider.of<CartProvider>(context, listen: false);
    paymentGateways = apiService.getPaymentGateways();
  }

  @override
  Widget pageUI() {
    return SingleChildScrollView(
      child: Column(
        children: [
          FutureBuilder(
            future: paymentGateways,
            builder: (BuildContext context,
                AsyncSnapshot<List<PaymentGatewaysModel>> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text(snapshot.error.toString());
                  break;
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                  break;
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  return ListView.separated(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (snapshot.data[index].enabled == true) {
                        return RadioListTile(
                          value: snapshot.data[index].id,
                          groupValue: _paymentGatewaysID,
                          onChanged: (value) {
                            setState(() {
                              _paymentGatewaysID = value.toString();
                            });
                            cartProvider.orderModel.payment_method =
                                snapshot.data[index].id;
                            cartProvider.orderModel.payment_method_title =
                                snapshot.data[index].title;
                            cartProvider.orderModel.set_paid = false;
                          },
                          toggleable: true,
                          title: Text(
                            snapshot.data[index].title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            snapshot.data[index].description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                          isThreeLine: true,
                        );
                      }
                      return null;
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: snapshot.data.length,
                  );
              }
              return null;
            },
          ),
          const SizedBox(height: AppSize.s20),
          FormHelper.saveButton(
            'Suivant',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderSuccessWidget(),
                ),
              );
            },
          ),
          const SizedBox(height: AppSize.s20),
        ],
      ),
    );
  }
}
