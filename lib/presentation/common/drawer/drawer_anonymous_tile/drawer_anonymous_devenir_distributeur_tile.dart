import 'package:flutter/material.dart';

class DrawerDevenirDistributeurTile extends StatelessWidget {
  const DrawerDevenirDistributeurTile({
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
      child: const ListTile(
        enabled: false,
        title: Text(
          'DEVENIR DISTRIBUTEUR',
          style: TextStyle(color: Colors.white),
        ),
        tileColor: Colors.black,
      ),
    );
  }
}
