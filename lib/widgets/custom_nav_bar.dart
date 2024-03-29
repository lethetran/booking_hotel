import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../gen/fonts.gen.dart';
import '../models/hotel_model.dart';
import '../screens/booking_screens/history_booking.dart';
import '../screens/home_screens/home_screen.dart';
import '../screens/map_screens/map_screen.dart';
import '../screens/profile_screens/profile_screen.dart';

class CustomNavBar extends StatelessWidget {
  final int index;

  const CustomNavBar({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.only(top:10.0, left: 20.0, right: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavBarIcon(
              iconPath: 'assets/icon/home.svg',
              text: 'Home',
              isSelected: index == 0,
              onTap: () {
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
            ),
             _NavBarIcon(
              iconPath: 'assets/icon/map.svg',
              text: 'Map',
              isSelected: index == 1,
              onTap: () async {
                List<HotelModel> hotels = await parseJson();
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(
                    builder: (context) =>WidgetMarkersScreen(hotels: hotels),
                  ),
                );
              },
            ),
            _NavBarIcon(
              iconPath: 'assets/icon/booking.svg',
              text: 'Booking',
              isSelected: index == 2,
              onTap: () {
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(
                    builder: (context) =>BookingScreen(),
                  ),
                );
              },
            ),
            _NavBarIcon(
              iconPath: 'assets/icon/profile.svg',
              text: 'Profile',
              isSelected: index == 3,
              onTap: () {
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(
                    builder: (context) =>ProfileScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _NavBarIcon extends StatelessWidget{
  const _NavBarIcon({
    Key? key,
    required this.iconPath,
    required this.text,
    this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  final String iconPath;
  final String text;
  final Function()? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context){
    final color = isSelected ? Colors.blue : Colors.grey[250];
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children:[
          SvgPicture.asset(iconPath, color: color),
          const SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontFamily: FontFamily.workSans,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          
        ],
      ),
    );
  }
}