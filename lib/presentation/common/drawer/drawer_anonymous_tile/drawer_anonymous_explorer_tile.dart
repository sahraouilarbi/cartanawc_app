import 'package:flutter/material.dart';

import '/presentation/pages.dart';

class DrawerExplorerTile extends StatelessWidget {
  const DrawerExplorerTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFD2D2D2),
          ),
        ),
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AccueilPage(tabSelected: 2),
            ),
          );
        },
        title: const Text('EXPLORER'),
      ),
    );
  }
}
