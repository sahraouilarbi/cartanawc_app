import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '/presentation/ressources/appsize_manager.dart';

/*
 * Build Explorer Page from de site : www2.cartana.dz
 */
class TabExplorer extends StatelessWidget {
  const TabExplorer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Position? currentPosition =
        Provider.of<Position?>(context, listen: false);
    return (currentPosition != null)
        ? Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    currentPosition.latitude,
                    currentPosition.longitude,
                  ),
                  zoom: AppSize.s16,
                ),
              ),
              SizedBox(
                height: AppSize.s120,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    magasinCosmetiqueNeabByWidget('Boutique H'),
                    magasinCosmetiqueNeabByWidget('Glamour'),
                    magasinCosmetiqueNeabByWidget('CHANEL'),
                    magasinCosmetiqueNeabByWidget('Petit Coeur'),
                    magasinCosmetiqueNeabByWidget('La Princesse'),
                    magasinCosmetiqueNeabByWidget('Rima'),
                    magasinCosmetiqueNeabByWidget('Coin beauté'),
                    magasinCosmetiqueNeabByWidget('Beauty'),
                  ],
                ),
              ),
            ],
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}

Container magasinCosmetiqueNeabByWidget(String title) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(AppSize.s0_8),
      borderRadius: const BorderRadius.all(
        Radius.circular(AppSize.s5),
      ),
    ),
    margin: const EdgeInsets.all(AppMargin.m5),
    height: AppSize.s120,
    width: AppSize.s80,
    child: Center(
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
