import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '/presentation/common/state_render/sate_render_impl.dart';

abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  final StreamController _inputStateStreamController =
      BehaviorSubject<FlowState>();

  @override
  Sink get inputState => _inputStateStreamController.sink;

  @override
  Stream<FlowState> get outputState => _inputStateStreamController.stream
      .map((flowState) => flowState as FlowState);

  @override
  void dispose() {
    _inputStateStreamController.close();
  }
}

abstract class BaseViewModelInputs {
  void start();
  void dispose();
  Sink get inputState;
}

abstract class BaseViewModelOutputs {
  Stream<FlowState> get outputState;
}
