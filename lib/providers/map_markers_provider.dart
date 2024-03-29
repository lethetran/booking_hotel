import 'package:booking_hotel/repositories/hotel_respository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_markers_provider.g.dart';

@riverpod
class MapMarkers extends _$MapMarkers {
  @override
  Future<Set<Marker>> build() async{
    final HotelRespository hotelRespository = ref.watch(hotelRespositoryProvider);
    Set<Marker> markers = (await hotelRespository.getHotels()).map((hotel) {
      return Marker(
        markerId: MarkerId(hotel.id.toString()),
        position: hotel.coordinate,
      );
    }).toSet();
      return markers;
  }
}