import 'dart:math';

import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longtitude;
  var location = '';

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    double calc;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(location);
      latitude = position.latitude;
      longtitude = position.longitude;

      calc = calculateDistance(latitude, longtitude, 8.759475, 80.500039);
      print(calc);
      print(latitude);
      print(longtitude);
      return Future.value(calc);
    } catch (e) {
      print(e);
    }
  }
}

double calculateDistance(lat1, lon1, lat2, lon2) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}
