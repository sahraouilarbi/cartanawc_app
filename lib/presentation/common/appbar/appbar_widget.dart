import 'package:cartanawc_app/presentation/common/appbar/appbar_actions_login_icon.dart';
import 'package:cartanawc_app/presentation/common/appbar/appbar_actions_shopping_icon.dart';
import 'package:cartanawc_app/presentation/common/appbar/appbar_cartana_logo.dart';
import 'package:cartanawc_app/presentation/common/white_and_green_top_bar.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/presentation/ressources/color_manager.dart';
import 'package:flutter/material.dart';

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
        AppBarActionLoginIcon(),
      ],
    );
  }

  @override
  Size get preferredSize => hasTabs ? const Size.fromHeight(110) : Size.zero;
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
      AppBarActionLoginIcon(),
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
