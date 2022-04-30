import 'package:cartanawc_app/model_views/providers/loader_provider.dart';
import 'package:cartanawc_app/presentation/common/checkpoint_widget.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/presentation/ressources/color_manager.dart';
import 'package:cartanawc_app/presentation/ressources/progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CheckoutBasePage extends StatefulWidget {
  @override
  CheckoutBasePageState createState() => CheckoutBasePageState();
}

class CheckoutBasePageState<T extends CheckoutBasePage> extends State<T> {
  int currentPage = 0;
  bool showBackButton = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.white,
      body: Consumer<LoaderProvider>(
        builder: (context, loaderModel, child) {
          return ProgressHUD(
            isAsyncCall: loaderModel.isApiCallProcess,
            opacity: 0.3,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      AppPadding.p15,
                      AppPadding.p15,
                      AppPadding.p15,
                      AppPadding.p10,
                    ),
                    child: CheckPoints(
                      checkedTill: currentPage,
                      checkPoints: const [
                        'Expédition',
                        'Paiement',
                        'Commander',
                      ],
                      checkPointFilledColor: ColorManager.greenAccent,
                    ),
                  ),
                  Divider(color: ColorManager.grey),
                  pageUI(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      automaticallyImplyLeading: showBackButton,
      title: const Text(
        'Checkout',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      actions: const [],
      systemOverlayStyle: SystemUiOverlayStyle.light,
    );
  }

  Widget pageUI() {
    return null;
  }

  @override
  void dispose() {
    super.dispose();
  }
}

/*
@override
  Widget build(BuildContext context) {
    return Consumer<LoaderProvider>(
      builder: (context, loaderModel, child) {
        return Scaffold(
          appBar: _buildAppBar(),
          backgroundColor: Colors.white,
          body: ProgressHUD(
            isAsyncCall: loaderModel.isApiCallProcess,
            opacity: 0.3,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 10.0),
                    child: CheckPoints(
                      checkedTill: currentPage,
                      checkPoints: const [
                        'Expédition',
                        'Paiement',
                        'Commander',
                      ],
                      checkPointFilledColor: ThemeConfig.cartanaColorGreen,
                    ),
                  ),
                  Divider(color: ThemeConfig.cartanaColorGrey),
                  pageUI(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
 */
