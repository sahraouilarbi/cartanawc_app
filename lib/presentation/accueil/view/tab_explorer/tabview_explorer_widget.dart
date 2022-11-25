import 'dart:async';

import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/domain/entities/magasin_cosmetique_entity.dart';
import 'package:cartanawc_app/presentation/accueil/view/tab_explorer/tabview_explorer_viewmodel.dart';
import 'package:cartanawc_app/presentation/common/state_render/state_render_impl.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/*
 * Build Explorer Page from de site : www2.cartana.dz
 */
class TabExplorer extends StatefulWidget {
  const TabExplorer({Key? key}) : super(key: key);

  @override
  State<TabExplorer> createState() => _TabExplorerState();
}

class _TabExplorerState extends State<TabExplorer> {
  final TabviewExplorerViewModel _explorerViewModel =
      instance<TabviewExplorerViewModel>();

  final Completer<GoogleMapController> _mapController = Completer();

  late Position currentPosition;
  Future<void> _bind() async {
    _explorerViewModel.start();
    currentPosition = await _getCurrentPosition();
  }

  Future<Position> _getCurrentPosition() async {
    final bool _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!_serviceEnabled) {
      return Future.error('Service localisation est désactivé');
    }
    LocationPermission _permission = await Geolocator.checkPermission();
    if (_permission == LocationPermission.denied) {
      _permission = await Geolocator.requestPermission();
      if (_permission == LocationPermission.denied) {
        return Future.error('Service localisation non-authorisé');
      }
    }

    if (_permission == LocationPermission.deniedForever) {
      return Future.error(
        "L'autorisation de localisation est définitivement refusée, nous ne pouvons pas demander à nouveau d'autres autorisations",
      );
    }
    return Geolocator.getCurrentPosition();
  }

  // void _liveLocation() {
  //   const LocationSettings locationSettings = LocationSettings(
  //     accuracy: LocationAccuracy.high,
  //     distanceFilter: 100,
  //   );
  //   Geolocator.getPositionStream(locationSettings: locationSettings)
  //       .listen((Position position) {
  //     lat = position.latitude.toString();
  //     long = position.longitude.toString();
  //   });
  // }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  void dispose() {
    _explorerViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
      stream: _explorerViewModel.outputState,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
            ),
          );
        }
        if (snapshot.hasData) {
          return snapshot.data!.getScreenWidget(
            context,
            getScreenWidget(),
            () {
              _explorerViewModel.start();
            },
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget getScreenWidget() {
    return StreamBuilder(
      stream: _explorerViewModel.outputMagasinsCosmetiques,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Center(
              child: Text('Pas de données'),
            );
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return _displayMagasinsCosmetiques(snapshot);
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            }
            return const SizedBox();
        }
      },
    );
  }

  Widget _displayMagasinsCosmetiques(AsyncSnapshot snapshot) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        if (currentPosition != null)
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(
                currentPosition.latitude,
                currentPosition.longitude,
              ),
              zoom: 14,
            ),
            onMapCreated: (GoogleMapController _controller) {
              _mapController.complete(_controller);
            },
          )
        else
          const Center(
            child: Text(
              'Loading map ...',
            ),
          ),
        SizedBox(
          height: AppSize.s120,
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List<MagasinCosmetiqueEntity>.from(
              snapshot.data as List<dynamic>,
            )
                .map(
                  (e) => magasinCosmetiqueNeabByWidget(e.title.rendered),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

Widget magasinCosmetiqueNeabByWidget(String title) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(AppSize.s0_8),
      borderRadius: const BorderRadius.all(
        Radius.circular(AppSize.s5),
      ),
    ),
    margin: const EdgeInsets.all(AppMargin.m5),
    height: AppSize.s80,
    width: AppSize.s80,
    child: Center(
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 12),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
