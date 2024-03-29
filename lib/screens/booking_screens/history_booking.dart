import 'package:booking_hotel/screens/booking_screens/booking_list.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_nav_bar.dart';

class BookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Hotel'),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: CustomNavBar(index: 2),
      body: BookingList(),
    );
  }
}