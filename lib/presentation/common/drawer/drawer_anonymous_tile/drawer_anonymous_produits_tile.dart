import 'package:cartanawc_app/presentation/accueil/accueil_view.dart';
import 'package:flutter/material.dart';

class DrawerProduitsTile extends StatelessWidget {
  const DrawerProduitsTile({
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
              builder: (context) => const AccueilPage(tabSelected: 0),
            ),
          );
        },
        title: const Text('PRODUITS'),
      ),
    );
  }
}
