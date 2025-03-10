import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapWithMarkers extends StatelessWidget {
  MapWithMarkers({super.key});

  final LatLng mapCenter = LatLng(13.085016, 80.181948);

  final double initialZoom = 16.0;

  final List<Map<String, dynamic>> markers = [
    {
      "location": LatLng(13.087625, 80.181837),
      "image": 'assets/images/doctor_1.png'
    },
    {
      "location": LatLng(13.087593, 80.180431),
      "image": 'assets/images/doctor_2.png'
    },
    {
      "location": LatLng(13.082751, 80.181742),
      "image": 'assets/images/doctor_3.png'
    },
    {
      "location": LatLng(13.086475, 80.182256),
      "image": 'assets/images/doctor_4.png'
    },
    {
      "location": LatLng(13.084521, 80.179088),
      "image": 'assets/images/doctor_5.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          initialCenter: mapCenter,
          initialZoom: initialZoom,
          onTap: (tapPosition, latLng) {
          },
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: markers.map((marker) {
              return Marker(
                width: 45.0,
                height: 45.0,
                point: marker["location"],
                child: CircleAvatar(
                  backgroundImage: AssetImage(marker["image"]),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
