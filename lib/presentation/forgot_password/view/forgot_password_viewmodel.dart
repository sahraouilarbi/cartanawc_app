import 'dart:async';

import '/domain/entities/entities.dart';
import '/presentation/base/base.dart';
import '/presentation/common/state_render/sate_render_impl.dart';

class ForgotPasswordViewModel extends BaseViewModel
    with ForgotPasswordViewModelInputs, ForgotPasswordViewModelOutputs {
  final StreamController _emailStreamController =
      StreamController<String>.broadcast();
  final StreamController _isAllInputsValidStreamController =
      StreamController<void>.broadcast();
  final isEmailSentSuccessfullyStreamController =
      StreamController<ResetPasswordResponseEntity>();

  String email = '';
  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    _emailStreamController.close();
    _isAllInputsValidStreamController.close();
    isEmailSentSuccessfullyStreamController.close();
  }

  @override
  void forgotPassword() {
    // TODO: implement forgotPassword
  }

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputIsAllInputsValid => _isAllInputsValidStreamController.sink;

  @override
  Stream<bool> get outputIsEmailValid => _emailStreamController.stream
      .map((email) => _isEmailValid(email as String));

  @override
  Stream<bool> get outputIsAllInputsValid =>
      _isAllInputsValidStreamController.stream.map((_) => _isAllInputsValid());

  void _validate() {
    inputIsAllInputsValid.add(null);
  }

  @override
  void setEmail(String _email) {
    inputEmail.add(_email);
    _validate();
  }

  bool _isEmailValid(String _email) {
    return _email.isNotEmpty && _email.contains('@');
  }

  bool _isAllInputsValid() {
    return _isEmailValid(email);
  }
}

abstract class ForgotPasswordViewModelInputs {
  void setEmail(String email);
  void forgotPassword();
  Sink get inputEmail;
  Sink get inputIsAllInputsValid;
}

abstract class ForgotPasswordViewModelOutputs {
  Stream<bool> get outputIsEmailValid;
  Stream<bool> get outputIsAllInputsValid;
}
