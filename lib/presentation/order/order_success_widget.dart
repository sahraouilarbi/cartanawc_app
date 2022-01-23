import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/presentation/checkout/checkout_base.dart';
import 'package:cartanawc_app/presentation/home/home_view.dart';
import 'package:cartanawc_app/model_views/providers/cart_provider.dart';
import 'package:cartanawc_app/presentation/ressources/theme_config.dart';
import 'package:cartanawc_app/presentation/common/textbuttom_widget.dart';
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
            margin: const EdgeInsets.only(top: AppMargin.m100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      width: AppSize.s120,
                      height: AppSize.s120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            ThemeConfig.cartanaColorGreen
                                .withOpacity(AppSize.s1),
                            ThemeConfig.cartanaColorGreen
                                .withOpacity(AppSize.s0_2),
                          ],
                        ),
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: AppSize.s75,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: AppPadding.p25, horizontal: AppPadding.p15),
                  child: Text(
                      //TODO Inserer numéro de Commande à ?????
                      'Votre commande #????? a été passée, vous serez contacté par le service commercial.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline5),
                ),
                textButton(
                  onPressed: () {
                    //TODO Ajouter reset du panier
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(
                            tabSelected: 0,
                          ),
                        ),
                        ModalRoute.withName('/Home'));
                  },
                  text: 'Terminer',
                  textColor: Colors.white,
                  backgroundColor: ThemeConfig.cartanaColorGreen,
                ),
                const SizedBox(height: AppSize.s20),
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
