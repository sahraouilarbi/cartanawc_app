import 'package:geolocator/geolocator.dart';

// https://www.youtube.com/watch?v=Dme03oxZRU0
// https://github.com/nhandrew/googlemap1

class GeoLocatorService {
  Future<Position> getLocation() async {
    final Position getCurrentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return getCurrentPosition;
  }
}
