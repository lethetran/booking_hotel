import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_location_provider.g.dart';

@riverpod
class MapLocation extends _$MapLocation{
  @override
  LatLng build(){
    return LatLng(10.762622, 106.660172);
  }

  void setMapLocation(LatLng posotion){
    state = posotion;
  }
}