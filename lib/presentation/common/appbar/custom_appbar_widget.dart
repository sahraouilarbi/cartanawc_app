import 'package:flutter/material.dart';

import '/presentation/common/appbar/widgets/action_customer.dart';
import '/presentation/common/appbar/widgets/action_shopping.dart';
import '/presentation/common/appbar/widgets/cartana_logo.dart';
import '/presentation/common/white_and_green_top_bar.dart';
import '/presentation/ressources/appsize_manager.dart';
import '/presentation/ressources/color_manager.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key key,
    this.hasTabs = false,
    this.tabController,
    this.tabs,
    this.isLoginPage = false,
    this.isUserProfilePage = false,
  }) : super(key: key);

  final bool hasTabs;
  final TabController tabController;
  final List<Tab> tabs;
  final bool isLoginPage;
  final bool isUserProfilePage;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: const AppBarCartanaLogo(),
      centerTitle: true,
      backgroundColor: Colors.black,
      bottom: buildBottomAppBar(
        tabController: tabController,
        tabs: tabs,
        hasTabs: hasTabs,
      ),
      actions: [
        const AppBarActionShoppingIcon(),
        AppBarActionCustomerIcon(),
      ],
    );
  }

  @override
  Size get preferredSize => hasTabs
      ? const Size.fromHeight(AppSize.s110)
      : const Size.fromHeight(AppSize.s62);
}

AppBar buildAppBar(
  BuildContext context, {
  bool hasTabs = false,
  TabController tabController,
  List<Tab> tabs,
  bool isLoginPage = false,
  bool isUserProfilePage = false,
}) {
  return AppBar(
    elevation: 0,
    title: const AppBarCartanaLogo(),
    centerTitle: true,
    backgroundColor: Colors.black,
    bottom: buildBottomAppBar(
      tabController: tabController,
      tabs: tabs,
      hasTabs: hasTabs,
    ),
    actions: [
      const AppBarActionShoppingIcon(),
      AppBarActionCustomerIcon(),
    ],
  );
}

PreferredSize buildBottomAppBar({
  bool hasTabs = false,
  TabController tabController,
  List<Tab> tabs,
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
