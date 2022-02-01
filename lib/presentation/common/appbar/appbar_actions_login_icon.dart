import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/core/prefs/app_prefs.dart';
import 'package:cartanawc_app/model_views/providers/auth_provider.dart';
import 'package:cartanawc_app/presentation/login/login.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/presentation/account/my_account_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarActionLoginIcon extends StatelessWidget {
  AppBarActionLoginIcon({
    Key key,
  }) : super(key: key);
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return IconButton(
          onPressed: () {
            _appPreferences.isUserLoggedIn().then((isUserLoggedIn) {
              if (isUserLoggedIn) {
                print('is user logged in ? : $isUserLoggedIn');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyAccountPage(),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginView(),
                  ),
                );
              }
            });
          },
          icon:
              //TODO !!!!
              authProvider.loggedInStatus == Status.loggedIn
                  ? const CircleAvatar(
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: AppSize.s20,
                      ),
                    )
                  : const Icon(Icons.person, color: Colors.grey),
        );
      },
    );
  }
}
