import 'dart:math';

import '../../../utils/getcurrentlocation.dart';

Future<dynamic> getdistance(double distance) async {
  Location location = Location();
  await location.getCurrentLocation();

  // distance = getdistance(location.latitude, location.longtitude);

  // double getdistance(double lat, double long) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((8.759475 - location.latitude) * p) / 2 +
      c(location.latitude * p) *
          c(8.759475 * p) *
          (1 - c((80.500039 - location.longtitude) * p)) /
          2;
  return distance = 12742 * asin(sqrt(a));
}
