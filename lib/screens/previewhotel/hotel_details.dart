import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../../models/hotel_model.dart';
import '../../widgets/app_text.dart';
import '../../widgets/custom_rating.dart';

class HotelDetails extends StatelessWidget {
  final HotelModel hotel;

  HotelDetails({required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Image.asset(
                hotel.avatarHotel,
                fit: BoxFit.cover,
              ),
            ),
            Arc(
              edge: Edge.TOP,
              arcType: ArcType.CONVEX,
              height: 30,
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              hotel.title,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Transform.scale(
                                scale: 1.25,
                                child: CustomRating(ratingScore: hotel.ratingScore),
                              ),
                            ),
                            const SizedBox(width: 135),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    AppTextSpan.large('\$${hotel.price}'),
                                    AppTextSpan.medium('/night'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                hotel.description,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Icon(Icons.wifi, size: 20.0),
                              Text('Wifi'),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.ac_unit, size: 20.0),
                              Text('Air Conditioning'),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.pool, size: 20.0),
                              Text('Swimming Pool'),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.restaurant, size: 20.0),
                              Text('Restaurant'),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.fitness_center, size: 20.0),
                              Text('Gym'),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 200,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: hotel.imagePaths.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Dialog(
                                            backgroundColor: Colors.transparent,
                                            child: Stack(
                                              alignment: Alignment.topRight,
                                              children: [
                                                PageView.builder(
                                                  itemCount: hotel.imagePaths.length,
                                                  itemBuilder: (context, index) {
                                                    return PhotoView(
                                                      imageProvider: AssetImage(hotel.imagePaths[index]),
                                                    );
                                                  },
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.of(context).pop();
                                                    },
                                                    child: Icon(
                                                      Icons.close,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Image.asset(hotel.imagePaths[index]),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}