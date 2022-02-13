import 'package:flutter/material.dart';

class DrawerContactTile extends StatelessWidget {
  const DrawerContactTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      enabled: false,
      title: Text(
        'CONTACT',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      tileColor: Colors.black,
    );
  }
}
