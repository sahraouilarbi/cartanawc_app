import 'package:cartanawc_app/presentation/a_propos/apropos_page.dart';
import 'package:flutter/material.dart';

class DrawerAProposTile extends StatelessWidget {
  const DrawerAProposTile({
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
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AProposPage(),
            ),
          );
        },
        title: const Text(
          'A PROPOS',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        tileColor: Colors.black,
      ),
    );
  }
}
