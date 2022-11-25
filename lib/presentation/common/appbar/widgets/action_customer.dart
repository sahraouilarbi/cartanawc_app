import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/core/prefs/app_prefs.dart';
import 'package:cartanawc_app/presentation/pages.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:flutter/material.dart';

class AppBarActionCustomerIcon extends StatelessWidget {
  AppBarActionCustomerIcon({Key? key}) : super(key: key);
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        _appPreferences.isUserLoggedIn().then(
          (isUserLoggedIn) {
            if (isUserLoggedIn) {
              Navigator.pushNamed(context, CustomerProfilePage.routeName);
            } else {
              Navigator.pushNamed(context, LoginPage.routeName);
            }
          },
        );
      },
      icon: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          shape: BoxShape.circle,
        ),
        child: const CircleAvatar(
          radius: AppSize.s20,
          backgroundColor: Colors.transparent,
          child: Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
