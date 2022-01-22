import 'package:cartanawc_app/presentation/common/appbar/appbar_actions_shopping_icon.dart';
import 'package:cartanawc_app/presentation/common/appbar/appbar_actions_customer_icon.dart';
import 'package:cartanawc_app/presentation/common/appbar/appbar_cartana_logo.dart';
import 'package:cartanawc_app/presentation/common/white_and_green_top_bar.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/utils/theme_config.dart';
import 'package:flutter/material.dart';

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
    bottom: buildBottomAppBar(
      tabController: tabController,
      tabs: tabs,
      hasTabs: hasTabs,
    ),
    actions: const [
      AppBarActionShoppingIcon(),
      AppBarActionConsumerIcon(),
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
            indicatorColor: ThemeConfig.cartanaColorGreen,
            unselectedLabelColor: ThemeConfig.cartanaColorGrey,
            tabs: tabs,
          ),
      ],
    ),
  );
}
