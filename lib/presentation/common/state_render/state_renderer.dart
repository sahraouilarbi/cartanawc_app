import 'package:cartanawc_app/core/extensions.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:flutter/material.dart';

enum StateRendererType {
  // POPUP STATE
  popupLoadingState,
  popupErrorState,
  popupSuccess,
  // FULLSCREEN STATE
  fullScreenLoadingState,
  fullScreenErrorState,
  //UI OF THE SCREEN
  contentScreenState,
  // EMPTY VIEW WHEN WE RECEIVE NO DATA FROM API
  emptyScreenState
}

class StateRenderer extends StatelessWidget {
  final StateRendererType stateRendererType;
  final String message;
  final String title;
  final Function? retryActionFunction;

  const StateRenderer({
    Key? key,
    required this.stateRendererType,
    String? message,
    String? title,
    required this.retryActionFunction,
  })  : message = message ?? 'Loading',
        title = title ?? kEMPTY,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.popupLoadingState:
        return _getPopUpDialog(
          context,
          [
            const CircularProgressIndicatorWidget(),
          ],
        );
      case StateRendererType.popupErrorState:
        return _getPopUpDialog(
          context,
          [
            _cancelIcon(),
            _getMessage(message),
            _getRetryButton(context, 'Ok'),
          ],
        );
      case StateRendererType.popupSuccess:
        return _getPopUpDialog(
          context,
          [
            _validIcon(),
            _getMessage(title),
            _getMessage(message),
            _getRetryButton(context, 'Ok'),
          ],
        );
      case StateRendererType.fullScreenLoadingState:
        return _getItemsInColumn([
          const CircularProgressIndicatorWidget(),
          _getMessage(message),
        ]);
      case StateRendererType.fullScreenErrorState:
        return _getItemsInColumn(
          [
            _cancelIcon(),
            _getMessage(message),
            _getRetryButton(context, 'Réessayer'),
          ],
        );
      case StateRendererType.contentScreenState:
        return Container();
      case StateRendererType.emptyScreenState:
        return _getItemsInColumn(
          [
            _getMessage(message),
          ],
        );
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
              if (stateRendererType == StateRendererType.fullScreenErrorState) {
                retryActionFunction?.call();
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
      size: AppSize.s60,
    );
  }

  Widget _validIcon() {
    return const Icon(
      Icons.check_circle,
      color: Colors.green,
      size: AppSize.s60,
    );
  }
}

class CircularProgressIndicatorWidget extends StatelessWidget {
  const CircularProgressIndicatorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(AppPadding.p40),
      child: CircularProgressIndicator(),
    );
  }
}
