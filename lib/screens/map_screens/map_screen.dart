import 'dart:ui' as ui;
import 'dart:async';

import 'package:booking_hotel/screens/map_screens/show_hotel_dialog.dart';
import 'package:booking_hotel/widgets/custom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../models/hotel_model.dart';

class WidgetMarkersScreen extends StatefulWidget {
  final List<HotelModel> hotels;
  const WidgetMarkersScreen({
    Key? key,
    required this.hotels,
  }) : super (key: key);

  @override
  State<WidgetMarkersScreen> createState() => _WidgetMarkersScreenState();
}

class _WidgetMarkersScreenState extends State<WidgetMarkersScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  final Map<String, Marker> _markers = {};

  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) => _onBuildCompleted());
  }

  Future<void> _onBuildCompleted() async {
    await Future.wait(
      widget.hotels.map((hotel) async {
        Marker marker = await _generateMarkersFromWidgets(hotel);
        _markers[marker.markerId.value] = marker;
      }).toList(),
    );
    setState(() {
      _isLoaded = true;
    });
  }

  Future<Marker> _generateMarkersFromWidgets(HotelModel hotel) async {
    final DialogHelper _dialogHelper = DialogHelper();
    
    final pictureRecorder = ui.PictureRecorder();
    final canvas = Canvas(pictureRecorder);

    final textPainter = TextPainter(
      text: TextSpan(
        text: '\$${hotel.price}',
        style: TextStyle(fontSize: 35.0, color: Colors.white),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    final rectWidth = textPainter.width + 20;

    final rect = Rect.fromLTWH(0, 0, rectWidth, 50);
    final paint = Paint()..color = Colors.black;
    canvas.drawRect(rect, paint);

    textPainter.paint(canvas, Offset(0, 0));

    final picture = pictureRecorder.endRecording();
    final image = await picture.toImage(rectWidth.toInt(), 100);
    final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
    final bitmapDescriptor = BitmapDescriptor.fromBytes(bytes!.buffer.asUint8List());

    return Marker(
      markerId: MarkerId(hotel.id.toString()),
      position: hotel.coordinate,
      icon: bitmapDescriptor,
      onTap: () => _dialogHelper.showHotelDialog(context, hotel),
    );
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: CustomNavBar(index: 1),
      body: 
      _isLoaded ?
      GoogleMap(
        myLocationEnabled: false,
        initialCameraPosition: CameraPosition(
          target: widget.hotels.isNotEmpty ? widget.hotels[0].coordinate : const LatLng(16.047079, 108.206230),
          zoom: 13,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: _markers.values.toSet(),
      ) : Center(child: CircularProgressIndicator()),
    );
  }
}