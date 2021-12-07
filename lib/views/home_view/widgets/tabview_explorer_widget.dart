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
                zoom: 16.0,
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      margin: const EdgeInsets.all(5.0),
                      height: 120,
                      width: 80,
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
