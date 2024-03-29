import 'package:booking_hotel/screens/previewhotel/previewHotelScreen.dart';
import 'package:booking_hotel/widgets/custom_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/hotel_model.dart';
import 'app_text.dart';

class HotelCard extends StatelessWidget {
  final HotelModel hotel;
  const HotelCard({
    Key? key,
    required this.hotel,
  }) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: (Colors.grey[500] ?? Colors.grey).withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
              ),
              child: Image.asset(
                hotel.avatarHotel,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Text('Error loading image: $error');
                },
              ),
            ),
          ),
          Flexible(
            flex:2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.large(
                    hotel.title,
                    fontSize: 18,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icon/location.svg'),
                      const SizedBox(width: 5),
                      AppText.small(hotel.location),
                    ],
                  ),
                  const SizedBox(height: 5),
                  CustomRating(ratingScore : hotel.ratingScore),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            AppTextSpan.large('\$${hotel.price}'),
                            AppTextSpan.medium('/night'),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => PreviewHotelScreen(hotel: hotel)),
                          );
                        }, 
                        child: const Text('Preview'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}