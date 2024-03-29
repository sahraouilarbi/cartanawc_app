import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/core/extensions.dart';
import 'package:cartanawc_app/data/api/api_service.dart';
import 'package:cartanawc_app/data/models/models.dart';
import 'package:cartanawc_app/presentation/base/base_checkout.dart';
import 'package:cartanawc_app/presentation/common/my_text_buttom_widget.dart';
import 'package:cartanawc_app/presentation/order/view/order_success_widget.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/presentation/ressources/color_manager.dart';
import 'package:cartanawc_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentMethodsPage extends CheckoutBasePage {
  static const String routeName = '/paymentMethods';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => PaymentMethodsPage(),
    );
  }

  @override
  _PaymentMethodsState createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends CheckoutBasePageState<PaymentMethodsPage> {
  late APIService apiService;
  late Future<List<PaymentGatewaysModel>> paymentGateways;
  String _paymentGatewaysID = kEMPTY;
  late CartProvider cartProvider;

  @override
  void initState() {
    super.initState();
    currentPage = 1;
    apiService = instance<APIService>();
    cartProvider = Provider.of<CartProvider>(context, listen: false);
    paymentGateways = apiService.getPaymentGateways();
  }

  @override
  Widget pageUI() {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          FutureBuilder(
            future: paymentGateways,
            builder: (
              BuildContext context,
              AsyncSnapshot<List<PaymentGatewaysModel>> snapshot,
            ) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text(snapshot.error.toString());
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  return Column(
                    children: [
                      ListView.separated(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          if (snapshot.data![index].enabled == true) {
                            return RadioListTile<String>(
                              value: snapshot.data![index].id!,
                              groupValue: _paymentGatewaysID,
                              onChanged: (value) {
                                setState(() {
                                  _paymentGatewaysID = value.toString();
                                });
                                cartProvider.orderModel.paymentMethod =
                                    snapshot.data![index].id;
                                cartProvider.orderModel.paymentMethodTitle =
                                    snapshot.data![index].title;
                                cartProvider.orderModel.setPaid = false;
                              },
                              toggleable: true,
                              title: Text(
                                snapshot.data![index].title!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                snapshot.data![index].description!,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                              isThreeLine: true,
                            );
                          }
                          return const SizedBox();
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemCount: snapshot.data!.length,
                      ),
                      const SizedBox(height: AppSize.s20),
                      MyTextButtonWidget(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderSuccessWidget(),
                            ),
                          );
                        },
                        backgroundColor: ColorManager.greenAccent,
                        textButton: 'SUIVANT',
                      ),
                      const SizedBox(height: AppSize.s20),
                    ],
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}
