import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '/presentation/pages.dart';
import '/presentation/ressources/appsize_manager.dart';
import '/presentation/ressources/color_manager.dart';
import '/providers/cart_provider.dart';

class AppBarActionShoppingIcon extends StatelessWidget {
  const AppBarActionShoppingIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartModel, child) {
        return GestureDetector(
          onTap: () {
            if (cartModel.cartItems.isEmpty) {
              final snackBar = SnackBar(
                content: const Text('Panier vide!'),
                backgroundColor: ColorManager.red,
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
          child: Badge(
            position: BadgePosition.topEnd(top: AppSize.s0, end: AppSize.s0),
            badgeContent: Text(
              '${cartModel.cartItems.length}',
              style: const TextStyle(color: Colors.white),
            ),
            toAnimate: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.s10),
              child: SvgPicture.asset(
                'assets/images/shopping_cart.svg',
                color: cartModel.cartItems.isEmpty ? Colors.grey : Colors.white,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
