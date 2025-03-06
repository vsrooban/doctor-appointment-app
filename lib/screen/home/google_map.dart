import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapWithMarkers extends StatelessWidget {
  // Define the initial map center (Chennai, Tamil Nadu)
  final LatLng mapCenter = LatLng(13.085016, 80.181948); // Chennai, TN
  final double initialZoom =
      17.0; // Adjusted zoom level for a better view of Tamil Nadu

  // Define the marker locations in Tamil Nadu
  final List<LatLng> markerLocations = [
    LatLng(13.087625, 80.181837),
    LatLng(13.087593, 80.180431),
    LatLng(13.082751, 80.181742),
    LatLng(13.086475, 80.182256),
    LatLng(13.084521, 80.179088),
    LatLng(13.084684, 80.180368),
  ];

  MapWithMarkers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          initialCenter: mapCenter, // Centered on Chennai
          initialZoom: initialZoom, // Adjusted for Tamil Nadu view
          onTap: (tapPosition, latLng) {
            print("Tapped location: ${latLng.latitude}, ${latLng.longitude}");
          },
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: markerLocations.map((location) {
              return Marker(
                  width: 80.0,
                  height: 80.0,
                  point: location,
                  // child: Icon(
                  //   Icons.location_on,
                  //   color: Colors.red,
                  //   size: 40.0,
                  // ),
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Image.asset('assets/images/doctor_2.png',  height: 15,fit: BoxFit.contain,
                    width: 15,),
                  ));
            }).toList(),
          ),
        ],
      ),
    );
  }
}
