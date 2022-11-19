import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/core/dependency_injection.dart';
import '/presentation/pages.dart';
import '/presentation/ressources/size_config.dart';
import '/providers/auth_provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  static const String routeName = '/auth';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const AuthPage(),
    );
  }

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late AuthProvider authProvider;

  Future<void> _bind() async {
    const int _commander = 0;
    const int _accueil = 1;
    authProvider = Provider.of<AuthProvider>(context, listen: false);
    await authProvider.isUserLoggedIn();
    if (authProvider.loggedInStatus == Status.loggedIn) {
      resetDIModules();
      Navigator.pushNamed(
        context,
        TableauBordPage.routeName,
        arguments: _commander,
      );
    }
    Navigator.pushNamed(
      context,
      AccueilPage.routeName,
      arguments: _accueil,
    );
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  Widget build(BuildContext context) {
    //Initialisation de valeurs MediaQuery
    SizeConfig().init(context);

    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Bienvenue',
          style: TextStyle(color: Colors.white, fontSize: 24.0),
        ),
      ),
    );
  }
}
