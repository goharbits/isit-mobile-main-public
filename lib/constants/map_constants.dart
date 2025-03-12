import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapConstants {
  static final CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(38.7946, 106.5348), // UAE coordinates
    zoom: 14.4746,
  );
}