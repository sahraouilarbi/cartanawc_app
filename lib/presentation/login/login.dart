import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/core/prefs/app_prefs.dart';
import 'package:cartanawc_app/presentation/common/state_render/sate_render_impl.dart';
import 'package:cartanawc_app/presentation/login/login_viewmodel.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/presentation/ressources/color_manager.dart';
import 'package:cartanawc_app/presentation/common/appbar/appbar_widget.dart';
import 'package:cartanawc_app/presentation/common/page_header_stack_widget.dart';
import 'package:cartanawc_app/presentation/ressources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class LoginView extends StatefulWidget {
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
      (token) {
        SchedulerBinding.instance.addPostFrameCallback(
          (_) {
            _appPreferences.setUserToken(token.toString());
            _appPreferences.setIsUserLoggedIn();
            _appPreferences.setUsername(_usernameController.text);
            _appPreferences.setPassword(_passwordController.text);
            resetModules();
            Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
          },
        );
      },
    );
  }

  @override
  void initState() {
    _bind();
    super.initState();
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
                    color: Colors.green,
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
        return TextFormField(
          controller: _usernameController,
          keyboardType: TextInputType.emailAddress,
          autocorrect: false,
          //onSaved: (input) => username = input,
          validator: (input) => !input.isNotEmpty
              ? "Le nom d'utilisateur ne peut pas être vide"
              : null,
          decoration: InputDecoration(
            hintText: "Nom d'utilisateur",
            errorText: (snapshot.data ?? true)
                ? null
                : "Saisissez un nom d'utilisateur valide",
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black87,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorManager.greenAccent,
              ),
            ),
          ),
        );
      },
    );
  }

//*******************************************************************
  Widget formFieldPassword() {
    return StreamBuilder<bool>(
      stream: _loginViewModel.outputIsPasswordValid,
      builder: (context, snapshot) {
        return TextFormField(
          controller: _passwordController,
          keyboardType: TextInputType.text,
          //onSaved: (input) => password = input,
          validator: (input) =>
              //TODO Password minimun
              input.length < 5
                  ? 'Mot de passe invalide. Doit contenir plus de 5 caractères'
                  : null,
          obscureText: _hidePassword,
          decoration: InputDecoration(
            hintText: "Mot de passe",
            errorText: (snapshot.data ?? true)
                ? null
                : "Le mot de passe ne doit pas être vide",
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black87,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorManager.greenAccent,
              ),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _hidePassword = !_hidePassword;
                });
              },
              icon:
                  Icon(_hidePassword ? Icons.visibility_off : Icons.visibility),
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
          return TextButton(
            onPressed: (snapshot.data ?? false)
                ? () {
                    _loginViewModel.login();
                  }
                : null,
            style: const ButtonStyle(),
            child: Container(
              padding: const EdgeInsets.all(AppPadding.p20),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(AppSize.s5),
              ),
              child: const Text(
                'SE CONNECTER',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
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
