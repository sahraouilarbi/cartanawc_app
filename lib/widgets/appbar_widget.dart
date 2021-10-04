import 'package:cartanawc_app/pages/cart_page.dart';
import 'package:cartanawc_app/pages/my_account_page.dart';
import 'package:cartanawc_app/provider/cart_provider.dart';
import 'package:cartanawc_app/provider/customer_provider.dart';
import 'package:cartanawc_app/utils/theme_config.dart';
import 'package:cartanawc_app/widgets/cartana_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

AppBar buildAppBar(
  BuildContext context, {
  bool hasTabs = false,
  TabController tabController,
  List<Tab> tabs,
  bool isLoginPage = false,
  bool isUserProfilePage = false,
}) {
  final AuthProvider authProvider =
      Provider.of<AuthProvider>(context, listen: false);
  final CustomerProvider customerProvider =
      Provider.of<CustomerProvider>(context, listen: false);
  return AppBar(
    elevation: 0,
    title: buildAppBarCartanaLogo(),
    centerTitle: true,
    bottom: buildBottomAppBar(
      tabController: tabController,
      tabs: tabs,
      hasTabs: hasTabs,
    ),
    actions: [
      Consumer<CartProvider>(builder: (context, cartModel, child) {
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
              const Icon(
                Icons.shopping_cart,
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
      }),
      IconButton(
          onPressed: () {
            if (!isLoginPage && !isUserProfilePage) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyAccountPage(),
                ),
              );
            }
          },
          icon:
              //TODO !!!!
              authProvider.loggedInStatus == Status.loggedIn
                  ? const Icon(Icons.person, color: Colors.white)
                  // CircleAvatar(
                  //         child: Image.network(
                  //             customerProvider.customerDetailModel.avatarUrl),
                  //       )
                  : Icon(Icons.person, color: Colors.grey[800])),
    ],
  );
}

Widget buildAppBarCartanaLogo() {
  return Container(
    padding: const EdgeInsets.only(left: 4.0, top: 4.0, right: 4.0),
    width: 44.0,
    height: 44.0,
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(5.0),
        topRight: Radius.circular(5.0),
      ),
    ),
    child: buildCartanaLogo(),
  );
}

PreferredSize buildBottomAppBar({
  bool hasTabs = false,
  TabController tabController,
  List<Tab> tabs,
}) {
  return PreferredSize(
    preferredSize: hasTabs ? const Size.fromHeight(50.0) : Size.zero,
    child: Column(
      children: [
        buildWhiteGreenBar(),
        if (hasTabs)
          TabBar(
            controller: tabController,
            indicatorColor: ThemeConfig.cartanaColorGreen,
            unselectedLabelColor: ThemeConfig.cartanaColorGrey,
            tabs: tabs,
          ),
      ],
    ),
  );
}

Widget buildWhiteGreenBar() {
  return Column(
    children: [
      Container(
        height: 14.0,
        color: Colors.white,
      ),
      Container(
        height: 4.0,
        color: ThemeConfig.kSecondaryColor,
      ),
    ],
  );
}
