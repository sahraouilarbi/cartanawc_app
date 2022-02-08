import 'package:flutter/material.dart';

class DrawerSolutionsPackagingTile extends StatelessWidget {
  const DrawerSolutionsPackagingTile({
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
          'SOLUTIONS PACKAGING',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        tileColor: Colors.black,
      ),
    );
  }
}
