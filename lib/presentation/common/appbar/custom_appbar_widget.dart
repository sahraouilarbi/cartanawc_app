import 'package:cartanawc_app/presentation/common/appbar/widgets/action_customer.dart';
import 'package:cartanawc_app/presentation/common/appbar/widgets/action_shopping.dart';
import 'package:cartanawc_app/presentation/common/appbar/widgets/cartana_logo.dart';
import 'package:cartanawc_app/presentation/common/white_and_green_top_bar.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/presentation/ressources/color_manager.dart';
import 'package:cartanawc_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.hasTabs = false,
    this.tabController,
    this.tabs,
  }) : super(key: key);

  final bool hasTabs;
  final TabController? tabController;
  final List<Tab>? tabs;

  @override
  Widget build(BuildContext context) {
    final Status loggedInStatus = context.read<AuthProvider>().loggedInStatus;

    return AppBar(
      elevation: 0,
      title: const AppBarCartanaLogo(),
      centerTitle: true,
      backgroundColor: Colors.black,
      bottom: buildBottomAppBar(
        tabController: tabController,
        tabs: hasTabs ? tabs! : <Tab>[],
        hasTabs: hasTabs,
      ),
      actions: [
        if (loggedInStatus == Status.loggedIn) const AppBarActionShoppingIcon(),
        AppBarActionCustomerIcon(),
      ],
    );
  }

  @override
  Size get preferredSize => hasTabs
      ? const Size.fromHeight(AppSize.s110)
      : const Size.fromHeight(AppSize.s62);
}

PreferredSize buildBottomAppBar({
  bool hasTabs = false,
  TabController? tabController,
  required List<Tab> tabs,
}) {
  return PreferredSize(
    preferredSize: hasTabs ? const Size.fromHeight(AppSize.s50) : Size.zero,
    child: Column(
      children: [
        const WhiteAndGreenBar(),
        if (hasTabs)
          TabBar(
            controller: tabController,
            indicatorColor: ColorManager.greenAccent,
            unselectedLabelColor: ColorManager.grey,
            tabs: tabs,
          ),
      ],
    ),
  );
}
