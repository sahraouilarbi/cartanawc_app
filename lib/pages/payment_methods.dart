import 'package:cartanawc_app/services/api_service.dart';
import 'package:cartanawc_app/models/payment_method_model.dart';
import 'package:cartanawc_app/pages/checkout_base.dart';
import 'package:cartanawc_app/provider/cart_provider.dart';
import 'package:cartanawc_app/utils/form_helper.dart';
import 'package:cartanawc_app/widgets/order_success_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentMethods extends CheckoutBasePage {
  @override
  _PaymentMethodsState createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends CheckoutBasePageState<PaymentMethods> {
  APIService apiService;
  Future<List<PaymentGateways>> paymentGateways;
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
                AsyncSnapshot<List<PaymentGateways>> snapshot) {
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
                            cartProvider.orderModel.paymentMethod =
                                snapshot.data[index].id;
                            cartProvider.orderModel.paymentMethodTitle =
                                snapshot.data[index].title;
                            cartProvider.orderModel.setPaid = false;
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
          const SizedBox(
            height: 20.0,
          ),
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
        ],
      ),
    );
  }
}
