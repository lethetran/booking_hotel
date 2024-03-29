import 'package:booking_hotel/models/hotel_model.dart';
import 'package:booking_hotel/repositories/hotel_respository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'all_hotel_provider.g.dart';


@riverpod
Future<List<HotelModel>> allHotels(AllHotelsRef ref) async{
  final HotelRespository hotelRespository = ref.watch(hotelRespositoryProvider);
  return hotelRespository.getHotels();
}