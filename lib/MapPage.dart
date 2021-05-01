import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with AutomaticKeepAliveClientMixin {
  Completer<GoogleMapController> _controller = Completer();

  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade300,
        leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Icon(
          Icons.arrow_back
        ),
      )),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(13.793406, 100.322514),
          zoom: 15,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          Marker(
            markerId: MarkerId('1'),
            position: LatLng(13.794655806897516, 100.32184381104851),
            infoWindow: InfoWindow(title: "True Coffee"),
          ),
          Marker(
              markerId: MarkerId('2'),
              position: LatLng(13.801957806518248, 100.31309814608949),
              infoWindow: InfoWindow(title: "Café du phin"),
          ),
          Marker(
              markerId: MarkerId('3'),
              position: LatLng(13.794073678057101, 100.32545306340758),
              infoWindow: InfoWindow(title: "Café Amazon For Chance"),
            ),
          Marker(
              markerId: MarkerId('4'),
              position: LatLng(13.801954627307081, 100.31732489224972),
              infoWindow: InfoWindow(title: "Cafe Salaya"),
            ),
            Marker(
              markerId: MarkerId('5'),
              position: LatLng(13.796311611984686, 100.32920449101829),
              infoWindow: InfoWindow(title: "LaMoon Cafe"),
            ),
            Marker(
              markerId: MarkerId('6'),
              position: LatLng(13.798609819947622, 100.31216326053165),
              infoWindow: InfoWindow(title: "Lumber Cafe Thailand"),
            ),
            Marker(
              markerId: MarkerId('7'),
              position: LatLng(13.797075543915275, 100.3309803057838),
              infoWindow: InfoWindow(title: "Buttery Cafe'"),
            ),
            Marker(
              markerId: MarkerId('8'),
              position: LatLng(13.787098072989552, 100.33067086201874),
              infoWindow: InfoWindow(title: "Amazon the brio mall salaya"),
            ),
        }
      ),
    );
  }

  
}
