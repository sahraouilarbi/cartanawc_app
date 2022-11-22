import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '/core/dependency_injection.dart';
import '/core/prefs/app_prefs.dart';
import '/presentation/common/appbar/custom_appbar_widget.dart';
import '/presentation/common/my_text_buttom_widget.dart';
import '/presentation/common/my_text_form_field_widget.dart';
import '/presentation/common/section_header_widget.dart';
import '/presentation/common/state_render/state_render_impl.dart';
import '/presentation/pages.dart';
import '/presentation/ressources/appsize_manager.dart';
import '/providers/auth_provider.dart';
import 'login_viewmodel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const String routeName = '/login';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const LoginPage(),
    );
  }

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginViewModel _loginViewModel = instance<LoginViewModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  bool _hidePassword = true;

  void _bind() {
    _loginViewModel.start();
    _usernameController.addListener(
        () => _loginViewModel.setUsername(_usernameController.text));
    _passwordController.addListener(
        () => _loginViewModel.setPassword(_passwordController.text));
    _loginViewModel.isUserLoggedInSuccessfullyStreamController.stream.listen(
      (dataEntity) {
        SchedulerBinding.instance!.addPostFrameCallback(
          (_) {
            _appPreferences.setUserToken(dataEntity.token.toString());
            _appPreferences.setUserId(dataEntity.id as int);
            _appPreferences.setIsUserLoggedIn();
            _appPreferences.setUsername(_usernameController.text);
            _appPreferences.setPassword(_passwordController.text);
            Provider.of<AuthProvider>(context, listen: false).isUserLoggedIn();
            resetDIModules();
            Navigator.pushNamed(context, TableauBordPage.routeName);
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
    _usernameController.dispose();
    _passwordController.dispose();
    _loginViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: const CustomAppBar(isLoginPage: true),
      appBar: const CustomAppBar(),
      backgroundColor: Colors.black,
      body: StreamBuilder<FlowState>(
        stream: _loginViewModel.outputState,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.hasData) {
            return snapshot.data!.getScreenWidget(
              context,
              _getContentWidget(),
              () {
                _loginViewModel.login();
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(
          left: AppPadding.p10,
          right: AppPadding.p10,
          bottom: AppPadding.p10,
        ),
        child: Column(
          children: <Widget>[
            const SectionHeader(sectionTitle: 'MON ESPACE'),
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
                  const SizedBox(height: AppSize.s10),
                  const Text(
                    'Bienvenue',
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: AppSize.s30),
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
      onPressed: () {
        Navigator.pushNamed(context, ForgotPasswordPage.routeName);
      },
      child: const Text('mot de passe oublié ?'),
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
