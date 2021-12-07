import 'package:cartanawc_app/model_views/providers/cart_provider.dart';
import 'package:cartanawc_app/utils/theme_config.dart';
import 'package:cartanawc_app/views/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarActionShoppingIcon extends StatelessWidget {
  const AppBarActionShoppingIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartModel, child) {
        return IconButton(
          onPressed: () {
            if (cartModel.cartItems.isEmpty) {
              final snackBar = SnackBar(
                content: const Text('Panier vide!'),
                backgroundColor: ThemeConfig.cartanaColorRed,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if (cartModel.cartItems.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ),
              );
            }
          },
          icon: Stack(
            children: [
              Icon(
                Icons.shopping_cart,
                color:
                    cartModel.cartItems.isNotEmpty ? Colors.white : Colors.grey,
              ),
              Visibility(
                visible: cartModel.cartItems.isNotEmpty,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2.5,
                      horizontal: 5.0,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    child: Text(
                      cartModel.cartItems.length.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 11.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
