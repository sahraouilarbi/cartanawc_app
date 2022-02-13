import 'package:cartanawc_app/model_views/providers/cart_provider.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/presentation/ressources/color_manager.dart';
import 'package:cartanawc_app/presentation/cart/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          icon: Stack(
            children: [
              SvgPicture.asset(
                'assets/images/shopping_cart.svg',
                color:
                    cartModel.cartItems.isNotEmpty ? Colors.white : Colors.grey,
                fit: BoxFit.cover,
              ),
              Visibility(
                visible: cartModel.cartItems.isNotEmpty,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppPadding.p2_5,
                      horizontal: AppPadding.p5,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppSize.s20),
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
