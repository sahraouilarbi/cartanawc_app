import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/core/prefs/app_prefs.dart';
import 'package:cartanawc_app/presentation/ressources/routes_manager.dart';
import 'package:flutter/material.dart';

class AppBarActionLoginIcon extends StatelessWidget {
  AppBarActionLoginIcon({Key key}) : super(key: key);
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        _appPreferences.isUserLoggedIn().then(
          (isUserLoggedIn) {
            if (isUserLoggedIn) {
              Navigator.pushReplacementNamed(context, Routes.profileRoute);
            } else {
              Navigator.pushReplacementNamed(
                context,
                Routes.loginRoute,
              );
            }
          },
        );
      },
      icon: const Icon(Icons.person),
    );
  }
}
