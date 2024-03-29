import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class BookingItem extends StatelessWidget {
  final DocumentSnapshot document;

  BookingItem({required this.document});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blue, Colors.lightBlueAccent],
        ),
      ),
      child: Column(
        children: [
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${data['title']}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
                ),
                SizedBox(height: 4),
                Text(
                  'Booking from ${DateFormat.yMd()
                  .format(DateTime
                  .fromMillisecondsSinceEpoch(data['from']))} to ${DateFormat.yMd()
                  .format(DateTime.fromMillisecondsSinceEpoch(data['to']))}',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 4),
                Text(
                  'Room type: ${data['roomType']}',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                SizedBox(height: 4),
                Text(
                  'Address: ${data['address']}',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.map, color: Colors.white),
                    onPressed: () async {
                      final coordinate = data['coordinate'];
                      final url = 'geo:${coordinate['latitude']},${coordinate['longitude']}';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  ),
                  SizedBox(width: 8.0),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.white),
                    onPressed: () async {
                      await FirebaseFirestore.instance.collection('bookings').doc(document.id).delete();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}