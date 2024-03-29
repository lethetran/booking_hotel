import 'package:booking_hotel/screens/profile_screens/body.dart';
import 'package:booking_hotel/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,      
      ),
      bottomNavigationBar: CustomNavBar(index: 3),
      body: Body(),
    );
  }
}