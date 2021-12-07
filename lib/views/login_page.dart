import 'dart:async';

import 'package:cartanawc_app/model_views/providers/auth_provider.dart';
import 'package:cartanawc_app/services/shared_service.dart';
import 'package:cartanawc_app/utils/theme_config.dart';
import 'package:cartanawc_app/utils/form_helper.dart';
import 'package:cartanawc_app/utils/progress_hud.dart';
import 'package:cartanawc_app/core/widgets/appbar_widget.dart';
import 'package:cartanawc_app/views/widgets/page_header_stack_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  String username;
  String password;
  //APIService apiService;
  AuthProvider authProvider;

  @override
  void initState() {
    super.initState();
    //apiService = APIService();
    authProvider = Provider.of<AuthProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      isAsyncCall: isApiCallProcess,
      opacity: 0.3,
      child: _uiSetup(context),
    );
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, isLoginPage: true),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              pageHeaderStack(pageHeader: 'MON ESPACE'),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 50.0,
                ),
                color: Colors.white,
                child: Column(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 120.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        'Bienvenue',
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Form(
                      key: globalKey,
                      child: Column(
                        children: <Widget>[
                          textFormFieldUserName(),
                          const SizedBox(height: 20.0),
                          textFormFieldPassword(),
                          const SizedBox(height: 30.0),
                          textButtonRecoverAccount(),
                          textButtonLogin(context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField textFormFieldUserName() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      onSaved: (input) => username = input,
      validator: (input) => !input.isNotEmpty
          ? "Le nom d'utilisateur ne peut pas être vide"
          : null,
      decoration: InputDecoration(
        hintText: "Nom d'utilisateur",
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black87,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ThemeConfig.cartanaColorGreen,
          ),
        ),
      ),
    );
  }

//*******************************************************************
  TextFormField textFormFieldPassword() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (input) => password = input,
      validator: (input) =>
          //TODO Password minimun
          input.length < 5
              ? 'Mot de passe invalide. Doit contenir plus de 5 caractères'
              : null,
      obscureText: hidePassword,
      decoration: InputDecoration(
        hintText: "Mot de passe",
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black87,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ThemeConfig.cartanaColorGreen,
          ),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              hidePassword = !hidePassword;
            });
          },
          icon: Icon(hidePassword ? Icons.visibility_off : Icons.visibility),
        ),
      ),
    );
  }

//*******************************************************************
  TextButton textButtonRecoverAccount() {
    return TextButton(
      onPressed: () {},
      child: const Text('compte oublié ?'),
    );
  }

//*******************************************************************
  TextButton textButtonLogin(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (validateAndSave()) {
          setState(() {
            isApiCallProcess = true;
          });
          //apiService.customerLogin(username, password).then((ret) {
          authProvider.login(username, password).then((ret) {
            setState(() {
              isApiCallProcess = false;
            });
            if (ret.success) {
              int _count = 0;

              SharedService.setLoginDetails(ret);

              Timer(const Duration(seconds: 2), () {
                Navigator.of(context).popUntil((route) {
                  return _count++ == 2;
                });
              });
              FormHelper.showMessage(
                context,
                'Cartana App',
                'Login successfull',
                'ok',
                () {
                  Navigator.of(context).popUntil((route) {
                    return _count++ == 2;
                  });
                },
              );
            } else {
              FormHelper.showMessage(
                context,
                'Cartana App',
                'Login invalide',
                'Ok',
                () {
                  Navigator.of(context).pop();
                },
              );
            }
          });
        }
      },
      style: const ButtonStyle(),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: const Text(
          'SE CONNECTER',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

//*******************************************************************
  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
