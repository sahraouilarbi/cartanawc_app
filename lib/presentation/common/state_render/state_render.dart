import 'package:cartanawc_app/presentation/common/state_render/state_renderer.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();
  String getMessage();
}
