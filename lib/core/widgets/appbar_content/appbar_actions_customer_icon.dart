import 'package:cartanawc_app/model_views/providers/auth_provider.dart';
import 'package:cartanawc_app/views/my_account_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarActionConsumerIcon extends StatelessWidget {
  const AppBarActionConsumerIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return IconButton(
          onPressed: () {
            //if (!isLoginPage && !isUserProfilePage) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyAccountPage(),
              ),
            );
            //}
          },
          icon:
              //TODO !!!!
              authProvider.loggedInStatus == Status.loggedIn
                  ? const CircleAvatar(
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 20.0,
                      ),
                    )
                  : const Icon(Icons.person, color: Colors.grey),
        );
      },
    );
  }
}
