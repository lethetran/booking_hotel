import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/hotel_model.dart';

class BookingDialog extends StatefulWidget {
  final HotelModel hotel;

  BookingDialog({required this.hotel});

  @override
  _BookingDialogState createState() => _BookingDialogState();
}
class _BookingDialogState extends State<BookingDialog> {
  final _fromDateController = TextEditingController();
  final _toDateController = TextEditingController();
  final _roomTypeController = TextEditingController();
  DateTime? _fromDate;
  DateTime? _toDate;
  String? _selectedRoomType;
  final _roomTypes = ['Single room', 'Double room', 'Twin room', 'Triple room', 'Single bed', 'Suite', 'Adjoining room', 'Bed and breakfast'];
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: AlertDialog(
          title: Text(
            'Book a room',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 8.0),
              TextFormField(
                controller: _fromDateController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'From',
                  prefixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(),
                ),
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2025),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _fromDate = pickedDate;
                      _fromDateController.text = DateFormat.yMd().format(pickedDate);
                    });
                  }
                },
              ),
              SizedBox(height: 12.0),
              TextFormField(
                controller: _toDateController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'To',
                  prefixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(),
                ),
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: _fromDate ?? DateTime.now(),
                    firstDate: _fromDate ?? DateTime.now(),
                    lastDate: DateTime(2025),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _toDate = pickedDate;
                      _toDateController.text = DateFormat.yMd().format(pickedDate);
                    });
                  }
                },
              ),
              SizedBox(height: 12.0),
              DropdownButtonFormField<String>(
                value: _selectedRoomType,
                decoration: InputDecoration(
                  hintText: 'Select room type',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                items: _roomTypes.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedRoomType = newValue;
                    _roomTypeController.text = newValue ?? '';
                  });
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Exit'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade100,
                textStyle: TextStyle(color: Colors.white),
              ),
              child: Text('Book now'),
              onPressed: () async {
                if (_fromDate != null && _toDate != null && _selectedRoomType != null) {
                  await FirebaseFirestore.instance.collection('bookings').add({
                    'coordinate': {
                      'latitude': widget.hotel.coordinate.latitude,
                      'longitude': widget.hotel.coordinate.longitude,
                    },
                    'title': widget.hotel.title,
                    'from': _fromDate!.millisecondsSinceEpoch,
                    'to': _toDate!.millisecondsSinceEpoch,
                    'roomType': _selectedRoomType,
                    'address': widget.hotel.address,
                  });
                  _scaffoldMessengerKey.currentState!.showSnackBar(
                    SnackBar(
                      content: Text('Booking successful'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  Future.delayed(Duration(seconds: 1), () {
                    Navigator.pop(context);
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
