import 'package:booking_hotel/screens/previewhotel/hotel_details.dart';
import 'package:flutter/material.dart';
import '../../models/hotel_model.dart';
import 'booking_dialog.dart';

class PreviewHotelScreen extends StatefulWidget {
  final HotelModel hotel;
  const PreviewHotelScreen({
    Key? key,
    required this.hotel,
  }) : super(key: key);

  @override
  _PreviewHotelScreenState createState() => _PreviewHotelScreenState();
}

class _PreviewHotelScreenState extends State<PreviewHotelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Booking Hotel',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: HotelDetails(hotel: widget.hotel),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return BookingDialog( hotel: widget.hotel);
              },
            );
          },
          child: Text(
            'Book now',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
