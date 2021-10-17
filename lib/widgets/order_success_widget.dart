import 'package:cartanawc_app/pages/checkout_base.dart';
import 'package:cartanawc_app/pages/home_page.dart';
import 'package:cartanawc_app/provider/cart_provider.dart';
import 'package:cartanawc_app/utils/theme_config.dart';
import 'package:cartanawc_app/widgets/textbuttom_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderSuccessWidget extends CheckoutBasePage {
  @override
  _OrderSuccessWidgetState createState() => _OrderSuccessWidgetState();
}

class _OrderSuccessWidgetState
    extends CheckoutBasePageState<OrderSuccessWidget> {
  @override
  void initState() {
    super.initState();
    currentPage = 2;
    showBackButton = false;
    final orderProvider = Provider.of<CartProvider>(context, listen: false);
    orderProvider.createOrder();
  }

  @override
  Widget pageUI() {
    return Consumer<CartProvider>(builder: (
      context,
      orderModel,
      child,
    ) {
      if (orderModel.isOrderCreated) {
        return Center(
          child: Container(
            margin: const EdgeInsets.only(top: 100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            ThemeConfig.cartanaColorGreen.withOpacity(1.0),
                            ThemeConfig.cartanaColorGreen.withOpacity(0.2),
                          ],
                        ),
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 75,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 25.0, horizontal: 15.0),
                  child: Text(
                      //TODO Inserer numéro de Commande à ?????
                      'Votre commande #????? a été passée, vous serez contacté par le service commercial.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline5),
                ),
                textButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(
                            tabSelected: 0,
                          ),
                        ),
                        ModalRoute.withName('/Home'));
                  },
                  text: 'Terminer',
                  textColor: Colors.white,
                  backgroundColor: ThemeConfig.cartanaColorGreen,
                ),
              ],
            ),
          ),
        );
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
