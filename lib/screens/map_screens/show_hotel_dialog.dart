import 'package:flutter/material.dart';

import '../../models/hotel_model.dart';
import '../previewhotel/previewHotelScreen.dart';

class DialogHelper{
  void showHotelDialog(BuildContext context, HotelModel hotel){
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 1.0,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              color: Colors.white,
              child: ListView.builder(
                controller: scrollController,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child:Image.asset(
                          hotel.avatarHotel,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(hotel.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      Text('Rating: ${hotel.ratingScore}'),
                      ElevatedButton(
                        child: Text('Preview'),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PreviewHotelScreen(hotel: hotel),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}