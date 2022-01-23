import 'package:cartanawc_app/presentation/ressources/theme_config.dart';
import 'package:flutter/material.dart';

class DrawerNouveautesTile extends StatelessWidget {
  const DrawerNouveautesTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      child: ListTile(
        enabled: false,
        title: const Text(
          'NOUVEAUTES',
          style: TextStyle(color: Colors.white),
        ),
        tileColor: ThemeConfig.kTercieryColor,
      ),
    );
  }
}
