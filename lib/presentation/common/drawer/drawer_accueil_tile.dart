import 'package:cartanawc_app/presentation/home/home_view.dart';
import 'package:flutter/material.dart';

class DrawerAccueilTile extends StatelessWidget {
  const DrawerAccueilTile({
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
              builder: (context) => const HomePage(tabSelected: 1),
            ),
          );
        },
        leading: const Icon(
          Icons.home,
          color: Colors.black,
        ),
        title: const Text('ACCUEIL'),
        shape: const Border(
          bottom: BorderSide(),
        ),
      ),
    );
  }
}
