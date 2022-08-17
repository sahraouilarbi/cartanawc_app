import 'dart:async';

import '/core/extensions.dart';
import '/data/models/models.dart';
import '/domain/usecase/login_usecase.dart';
import '/presentation/base/base_viewmodel.dart';
import '/presentation/common/freezed_data_class/freezed_data_classes.dart';
import '/presentation/common/state_render/sate_render_impl.dart';
import '/presentation/common/state_render/state_renderer.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  final StreamController _usernameStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  final StreamController _isAllInputsValidStreamController =
      StreamController<void>.broadcast();
  final StreamController isUserLoggedInSuccessfullyStreamController =
      StreamController<LoginResponseDataModel>();
  LoginObject loginObject = LoginObject(kEMPTY, kEMPTY);
  final LoginUsecase _loginUsecase;
  LoginViewModel(this._loginUsecase);

  @override
  void dispose() {
    _usernameStreamController.close();
    _passwordStreamController.close();
    _isAllInputsValidStreamController.close();
    isUserLoggedInSuccessfullyStreamController.close();
  }

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  Sink get inputUsername => _usernameStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputIsAllInputsValid => _isAllInputsValidStreamController.sink;

  @override
  Future<void> login() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await _loginUsecase.execute(
            LoginUsecaseInput(loginObject.username, loginObject.password)))
        .fold(
            (failure) => inputState.add(
                  ErrorState(
                      StateRendererType.popupErrorState, failure.message),
                ), (data) {
      inputState.add(ContentState());
      isUserLoggedInSuccessfullyStreamController.add(data.data);
    });
  }

  @override
  void setUsername(String username) {
    inputUsername.add(username);
    loginObject = loginObject.copyWith(username: username);
    _validate();
  }

  @override
  void setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
    _validate();
  }

  @override
  Stream<bool> get outputIsAllInputsValid =>
      _isAllInputsValidStreamController.stream.map((_) => _isAllInputsValid());

  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password as String));

  @override
  Stream<bool> get outputIsUsernameValid => _usernameStreamController.stream
      .map((username) => _isUsernameValid(username as String));

  void _validate() {
    inputIsAllInputsValid.add(null);
  }

  bool _isUsernameValid(String username) {
    return username.isNotEmpty;
  }

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isAllInputsValid() {
    return _isPasswordValid(loginObject.password) &&
        _isUsernameValid(loginObject.username);
  }
}

abstract class LoginViewModelInputs {
  void setUsername(String username);
  void setPassword(String password);
  void login();
  Sink get inputUsername;
  Sink get inputPassword;
  Sink get inputIsAllInputsValid;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outputIsUsernameValid;
  Stream<bool> get outputIsPasswordValid;
  Stream<bool> get outputIsAllInputsValid;
}
