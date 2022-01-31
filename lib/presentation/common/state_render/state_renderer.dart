import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:flutter/material.dart';

enum StateRendererType {
  POPUP_LOADING_STATE,
  POPUP_ERROR_STATE,
  POPUP_SUCCESS,
  FULL_SCREEN_LOADING_STATE,
  FULL_SCREEN_ERROR_STATE,
  CONTENT_SCREEN_STATE,
  EMPTY_SCREEN_STATE
}

class StateRenderer extends StatelessWidget {
  StateRendererType stateRendererType;
  String message;
  String title;
  Function retryActionFunction;
  StateRenderer({
    Key key,
    this.stateRendererType,
    this.message,
    this.title,
    this.retryActionFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.POPUP_LOADING_STATE:
        return _getPopUpDialog(context, [const CircularProgressIndicator()]);
      case StateRendererType.POPUP_ERROR_STATE:
        return _getPopUpDialog(context, [
          _cancelIcon(),
          _getMessage(message),
          _getRetryButton(context, 'Ok')
        ]);
      case StateRendererType.POPUP_SUCCESS:
        return _getPopUpDialog(context, [
          _validIcon(),
          _getMessage(title),
          _getMessage(message),
          _getRetryButton(context, 'Ok'),
        ]);
      case StateRendererType.FULL_SCREEN_LOADING_STATE:
        return _getItemsInColumn([
          const CircularProgressIndicator(),
          _getMessage(message),
        ]);
      case StateRendererType.FULL_SCREEN_ERROR_STATE:
        return _getItemsInColumn([
          _cancelIcon(),
          _getMessage(message),
          _getRetryButton(context, 'Réessayer'),
        ]);
      case StateRendererType.CONTENT_SCREEN_STATE:
        return Container();
      case StateRendererType.EMPTY_SCREEN_STATE:
        return _getItemsInColumn([_getMessage(message)]);
      default:
        return Container();
    }
  }

  Widget _getPopUpDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s14),
      ),
      elevation: AppSize.s2,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSize.s14),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: AppSize.s14,
              offset: Offset(AppSize.s0, AppSize.s14),
            ),
          ],
        ),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }

  Widget _getMessage(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: Text(message),
      ),
    );
  }

  Widget _getRetryButton(BuildContext context, String buttonTitle) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSize.s18),
        child: SizedBox(
          width: AppSize.s170,
          child: ElevatedButton(
            onPressed: () {
              if (stateRendererType ==
                  StateRendererType.FULL_SCREEN_ERROR_STATE) {
                retryActionFunction.call();
              } else {
                Navigator.of(context).pop();
              }
            },
            child: Text(buttonTitle),
          ),
        ),
      ),
    );
  }

  Widget _getItemsInColumn(List<Widget> children) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }

  Widget _cancelIcon() {
    return const Icon(
      Icons.cancel,
      color: Colors.red,
      size: AppSize.s30,
    );
  }

  Widget _validIcon() {
    return const Icon(
      Icons.check_circle,
      color: Colors.green,
      size: AppSize.s30,
    );
  }
}
