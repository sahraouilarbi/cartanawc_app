import 'package:cartanawc_app/model_views/providers/loader_provider.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/presentation/ressources/progress_hud.dart';
import 'package:cartanawc_app/presentation/common/appbar/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        appBar: buildAppBar(context),
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
