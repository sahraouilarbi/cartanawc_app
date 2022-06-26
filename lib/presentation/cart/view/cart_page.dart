import 'package:cartanawc_app/model_views/providers/cart_provider.dart';
import 'package:cartanawc_app/model_views/providers/loader_provider.dart';
import 'package:cartanawc_app/presentation/cart/view/cart_product_widget.dart';
import 'package:cartanawc_app/presentation/verify_address/view/verify_address_page.dart';
import 'package:cartanawc_app/presentation/common/my_text_buttom_widget.dart';
import 'package:cartanawc_app/presentation/common/row_montant.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/presentation/ressources/color_manager.dart';
import 'package:cartanawc_app/presentation/ressources/progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key key}) : super(key: key);

  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const CartPage(),
    );
  }

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panier'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Future.value(true), //SharedService.isLoggedIn(),
        builder: (BuildContext context, AsyncSnapshot<bool> loginModel) {
          if (loginModel.hasData) {
            if (loginModel.data) {
              return Consumer<LoaderProvider>(
                  builder: (context, loaderProvider, child) {
                return Scaffold(
                  body: ProgressHUD(
                    isAsyncCall: loaderProvider.isApiCallProcess,
                    opacity: 0.3,
                    child: SingleChildScrollView(
                      child: _cartItemsList(),
                    ),
                  ),
                );
              });
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _cartItemsList() {
    return Column(
      children: [
        // Titre de la page : 'Panier' + Icon Shopping cart
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p10,
            horizontal: AppPadding.p30,
          ),
          decoration: BoxDecoration(
            border: const Border(bottom: BorderSide()),
            color: ColorManager.blue,
          ),
          child: Row(
            children: [
              SvgPicture.asset('assets/images/shopping_cart.svg',
                  color: Colors.white, fit: BoxFit.cover),
              const SizedBox(width: AppSize.s5),
              const Text(
                'PANIER',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),

        // contenue du panier
        Consumer<CartProvider>(
          builder: (context, cartModel, child) {
            if (cartModel.cartItems != null && cartModel.cartItems.isNotEmpty) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: cartModel.cartItems.length,
                itemBuilder: (context, index) {
                  return CartProduct(data: cartModel.cartItems[index]);
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),

        //Button mettre à jour le panier
        Padding(
          padding: const EdgeInsets.all(AppPadding.p10),
          child: Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Provider.of<LoaderProvider>(context, listen: false)
                    .setLoadingStatus(status: true);
                final cartProvider =
                    Provider.of<CartProvider>(context, listen: false);
                cartProvider.updateCart((val) {
                  Provider.of<LoaderProvider>(context, listen: false)
                      .setLoadingStatus(status: false);
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Icon(Icons.sync),
                  SizedBox(
                    width: AppSize.s5,
                  ),
                  Text('Mettre à jour le panier'),
                ],
              ),
            ),
          ),
        ),

        const Divider(
          height: AppSize.s60,
        ),
        Padding(
          padding: const EdgeInsets.all(AppSize.s10),
          child: Consumer<CartProvider>(
            builder: (context, cartModel, child) {
              return MontantWidget(
                label: 'TOTAL',
                value: cartModel.totalAmount,
                fontSize: 18.0,
              );
            },
          ),
        ),
        const SizedBox(height: AppSize.s10),
        MyTextButtonWidget(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VerifyAddressPage(),
              ),
            );
          },
          backgroundColor: ColorManager.greenAccent,
          textButton: 'VALIDER LA COMMANDE',
        ),
        const SizedBox(height: AppSize.s20),
      ],
    );
  }
}

/*
Widget _cartItemsList() {
    return Consumer<CartProvider>(builder: (context, cartModel, child) {
      if (cartModel.cartItems != null && cartModel.cartItems.isNotEmpty) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: const Border(bottom: BorderSide()),
                    color: ThemeConfig.cartanaColorBlue,
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 30.0),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        'PANIER',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Consumer<CartProvider>(builder: (context, cartModel, child) {
                  if (cartModel.cartItems != null &&
                      cartModel.cartItems.isNotEmpty) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: cartModel.cartItems.length,
                      itemBuilder: (context, index) {
                        return CartProduct(data: cartModel.cartItems[index]);
                      },
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
                // ListView.builder(
                //   shrinkWrap: true,
                //   physics: const ClampingScrollPhysics(),
                //   itemCount: cartModel.cartItems.length,
                //   itemBuilder: (context, index) {
                //     return CartProduct(data: cartModel.cartItems[index]);
                //   },
                // ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Provider.of<LoaderProvider>(context, listen: false)
                            .setLoadingStatus(status: true);
                        final cartProvider =
                            Provider.of<CartProvider>(context, listen: false);
                        cartProvider.updateCart((val) {
                          Provider.of<LoaderProvider>(context, listen: false)
                              .setLoadingStatus(status: false);
                        });
                      },
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: const [
                          Icon(
                            Icons.sync,
                          ),
                          Text('Mettre à jour le panier'),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: 150.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Divider(color: Colors.black),
                        rowMontant(
                            textLabel: 'TOTAL',
                            valeurMontant: cartModel.totalAmount,
                            fontSize: 18.0),
                        textButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VerifyAddress(),
                              ),
                            );
                          },
                          text: 'VALIDER LA COMMANDE',
                          textColor: Colors.white,
                          backgroundColor: ThemeConfig.cartanaColorGreen,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
 */
