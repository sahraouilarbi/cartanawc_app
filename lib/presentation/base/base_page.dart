import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/presentation/common/appbar/custom_appbar_widget.dart';
import '/presentation/ressources/appsize_manager.dart';
import '/presentation/ressources/progress_hud.dart';
import '/providers/loader_provider.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key key}) : super(key: key);

  @override
  BasePageState createState() => BasePageState();
}

class BasePageState<T extends BasePage> extends State<T> {
  bool isApiCallProcess = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<LoaderProvider>(builder: (context, loaderProvider, child) {
      return Scaffold(
        //appBar: buildAppBar(context),
        appBar: const CustomAppBar(),
        body: ProgressHUD(
          isAsyncCall: isApiCallProcess,
          opacity: AppSize.s0_3,
          color: Colors.black,
          child: pageUI(),
        ),
      );
    });
  }

  Widget pageUI() {
    return null;
  }
}
