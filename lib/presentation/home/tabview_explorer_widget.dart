import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

/*
 * Build Explorer Page from de site : www2.cartana.dz
 */
Widget tabViewExplorer(BuildContext context) {
  final currentPosition = Provider.of<Position>(context);
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
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(AppSize.s5),
                        ),
                      ),
                      margin: const EdgeInsets.all(AppMargin.m5),
                      height: AppSize.s120,
                      width: AppSize.s80,
                      child: Center(child: Text((index + 1).toString())),
                    );
                  }),
            ),
          ],
        )
      : const Center(
          child: CircularProgressIndicator(),
        );
}