import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String addres;

  const PlaceLocation({
    @required this.latitude,
    @required this.longitude,
    this.addres,
  });

  LatLng toLatLng() => LatLng(this.latitude, this.longitude);
}

class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  Place({
    @required this.id,
    @required this.title,
    @required this.location,
    @required this.image,
  });
}
