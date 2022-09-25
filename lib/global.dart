import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Global {
  static double lat = 0;
  static double log = 0;
  static final LatLng _kMapCenter = LatLng(lat, log);

  static final CameraPosition kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);
}
