import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

Future<String> _loadFromAsset() async {
  return await rootBundle.loadString("lib/models/model.json");
}

Future<List<HotelModel>> parseJson() async {
  String jsonString = await _loadFromAsset();
  final jsonResponse = json.decode(jsonString);
  return jsonResponse.map<HotelModel>((json) => HotelModel.fromJson(json)).toList();
}

class HotelModel {
  final String id;
  final String title;
  final String avatarHotel;
  final String location;
  final String address;
  final String phone;
  final String description;
  final List<String> imagePaths;
  final double ratingScore;
  final double price;
  final LatLng coordinate;

  const HotelModel({
    required this.id,
    required this.title,
    required this.avatarHotel,
    required this.location,
    required this.address,
    required this.phone,
    required this.description,
    required this.imagePaths,
    required this.price,
    required this.coordinate,
    this.ratingScore = 0,
  });

  HotelModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        avatarHotel = json['avatarHotel'],
        location = json['location'],
        address = json['address'],
        phone = json['phone'],
        description = json['description'],
        imagePaths = List<String>.from(json['imagePaths']),
        price = json['price'].toDouble(),
        coordinate = LatLng(json['coordinate']['latitude'], json['coordinate']['longitude']),
        ratingScore = json['ratingScore'].toDouble();
}
