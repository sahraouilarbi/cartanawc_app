import 'package:flutter/material.dart';

import '/core/extensions.dart';
import '/presentation/common/state_render/state_renderer.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();
  String getMessage();
}

// Loading State (POPUP, FULL, SCREEN)
class LoadingState extends FlowState {
  LoadingState({required this.stateRendererType, String? message})
      : message = message ?? 'Loading';
  StateRendererType stateRendererType;
  String message;

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

// Error State (POPUP, FULL, SCREEN)
class ErrorState extends FlowState {
  ErrorState(this.stateRendererType, this.message);
  StateRendererType stateRendererType;
  String message;

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

// Content State
class ContentState extends FlowState {
  ContentState();

  @override
  String getMessage() => kEMPTY;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.contentScreenState;
}

// Empty State
class EmptyState extends FlowState {
  EmptyState(this.message);

  String message;

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.emptyScreenState;
}

class SuccessState extends FlowState {
  SuccessState(this.message);
  String message;

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => StateRendererType.popupSuccess;
}

extension FlowStateExtension on FlowState {
  Widget getScreenWidget(
    BuildContext context,
    Widget contentScreenWidget,
    Function retryActionFunction,
  ) {
    switch (this.runtimeType) {
      case LoadingState:
        {
          if (getStateRendererType() == StateRendererType.popupLoadingState) {
            _showPopUp(
              context,
              getStateRendererType(),
              getMessage(),
            );
            return contentScreenWidget;
          } else {
            return StateRenderer(
              stateRendererType: getStateRendererType(),
              message: getMessage(),
              retryActionFunction: retryActionFunction,
            );
          }
        }
      case ErrorState:
        {
          _dismissDialog(context);
          if (getStateRendererType() == StateRendererType.popupErrorState) {
            _showPopUp(
              context,
              getStateRendererType(),
              getMessage(),
            );
            return contentScreenWidget;
          } else {
            return StateRenderer(
              stateRendererType: getStateRendererType(),
              message: getMessage(),
              retryActionFunction: retryActionFunction,
            );
          }
        }
      case ContentState:
        {
          _dismissDialog(context);
          return contentScreenWidget;
        }
      case EmptyState:
        {
          return StateRenderer(
            stateRendererType: getStateRendererType(),
            message: getMessage(),
            retryActionFunction: retryActionFunction,
          );
        }
      case SuccessState:
        {
          _dismissDialog(context);
          _showPopUp(
            context,
            StateRendererType.popupSuccess,
            getMessage(),
            title: 'Success',
          );
          return contentScreenWidget;
        }
      default:
        {
          return contentScreenWidget;
        }
    }
  }

  void _dismissDialog(BuildContext context) {
    if (_isThereCurrentDialogShowing(context)) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }

  bool _isThereCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

  void _showPopUp(
      BuildContext context, StateRendererType stateRendererType, String message,
      {String title = kEMPTY}) {
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) => showDialog(
        context: context,
        builder: (BuildContext context) => StateRenderer(
          stateRendererType: stateRendererType,
          message: message,
          title: title,
          retryActionFunction: () {},
        ),
      ),
    );
  }
}
