import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/core/prefs/app_prefs.dart';
import 'package:cartanawc_app/presentation/common/my_text_buttom_widget.dart';
import 'package:cartanawc_app/presentation/common/state_render/sate_render_impl.dart';
import 'package:cartanawc_app/presentation/common/my_text_form_field_widget.dart';
import 'package:cartanawc_app/presentation/login/login_viewmodel.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/presentation/common/appbar/appbar_widget.dart';
import 'package:cartanawc_app/presentation/common/page_header_stack_widget.dart';
import 'package:cartanawc_app/presentation/ressources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _loginViewModel = instance<LoginViewModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  bool _hidePassword = true;
  //bool isApiCallProcess = false;
  //String username;
  //String password;

  void _bind() {
    _loginViewModel.start();
    _usernameController.addListener(
        () => _loginViewModel.setUsername(_usernameController.text));
    _passwordController.addListener(
        () => _loginViewModel.setPassword(_passwordController.text));
    _loginViewModel.isUserLoggedInSuccessfullyStreamController.stream.listen(
      (dataEntity) {
        SchedulerBinding.instance.addPostFrameCallback(
          (_) {
            _appPreferences.setUserToken(dataEntity.token.toString());
            _appPreferences.setUserId(dataEntity.id as int);
            _appPreferences.setIsUserLoggedIn();
            _appPreferences.setUsername(_usernameController.text);
            _appPreferences.setPassword(_passwordController.text);
            resetModules();
            Navigator.of(context).pushReplacementNamed(Routes.tableauBordRoute);
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  void dispose() {
    _loginViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, isLoginPage: true),
      body: StreamBuilder<FlowState>(
        stream: _loginViewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data.getScreenWidget(context, _getContentWidget(),
                  () {
                _loginViewModel.login();
              }) ??
              _getContentWidget();
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Container(
        color: Colors.black,
        padding: const EdgeInsets.only(
          left: AppPadding.p10,
          right: AppPadding.p10,
          bottom: AppPadding.p10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            pageHeaderStack(pageHeader: 'MON ESPACE'),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p20,
                vertical: AppPadding.p50,
              ),
              color: Colors.white,
              child: Column(
                children: [
                  const Icon(
                    Icons.person,
                    size: AppSize.s120,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: AppPadding.p20),
                    child: Text(
                      'Bienvenue',
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Form(
                    key: _globalKey,
                    child: Column(
                      children: <Widget>[
                        formFieldUsername(),
                        const SizedBox(height: AppSize.s20),
                        formFieldPassword(),
                        const SizedBox(height: AppSize.s30),
                        accountRecovery(),
                        buttonLogin(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget formFieldUsername() {
    return StreamBuilder<bool>(
      stream: _loginViewModel.outputIsUsernameValid,
      builder: (context, snapshot) {
        return MyTextFormFieldWidget(
          controller: _usernameController,
          keyboardType: TextInputType.emailAddress,
          hintText: "Nom d'Utilisateur",
          labelText: "Nom d'Utilisateur",
          errorText: snapshot.data ?? true
              ? null
              : "Saisissez un nom d'utilisateur valide",
        );
      },
    );
  }

//*******************************************************************
  Widget formFieldPassword() {
    return StreamBuilder<bool>(
      stream: _loginViewModel.outputIsPasswordValid,
      builder: (context, snapshot) {
        return MyTextFormFieldWidget(
          controller: _passwordController,
          keyboardType: TextInputType.text,
          hintText: 'Mot de passe',
          labelText: 'Mot de passe',
          errorText: snapshot.data ?? true
              ? null
              : "Le mot de passe ne doit pas être vide",
          obscureText: _hidePassword,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _hidePassword = !_hidePassword;
              });
            },
            icon: Icon(
              _hidePassword ? Icons.visibility_off : Icons.visibility,
            ),
          ),
        );
      },
    );
  }

//*******************************************************************
  Widget accountRecovery() {
    return TextButton(
      onPressed: () {},
      child: const Text('compte oublié ?'),
    );
  }

//*******************************************************************
  Widget buttonLogin() {
    return StreamBuilder<bool>(
        stream: _loginViewModel.outputIsAllInputsValid,
        builder: (context, snapshot) {
          return SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: MyTextButtonWidget(
              onPressed: snapshot.data ?? false
                  ? () {
                      _loginViewModel.login();
                    }
                  : null,
              textButton: 'SE CONNECTER',
            ),
          );
        });
  }

//*******************************************************************
  /*bool validateAndSave() {
    final form = _globalKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }*/
}
