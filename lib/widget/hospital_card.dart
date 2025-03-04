import 'package:doctor_appointment_app/widget/favourite_button.dart';
import 'package:flutter/material.dart';
import 'package:doctor_appointment_app/util/custom_theme.dart';

class HospitalList extends StatefulWidget {
  const HospitalList({super.key});

  @override
  _HospitalListState createState() => _HospitalListState();
}

class _HospitalListState extends State<HospitalList> {
  final List<Map<String, String>> clinics = [
    {
      "image": "assets/images/hospital_1.png",
      "name": "Sunrise Health Clinic",
      "address": "123 Oak Street, CA 98765",
      "rating": "5.0",
      "reviews": "128",
      "distance": "2.5 km",
      "category": "Hospital"
    },
    {
      "image": "assets/images/hospital_2.png",
      "name": "Golden Cardiology Center",
      "address": "555 Bridge Street, Golden Gate",
      "rating": "4.9",
      "reviews": "58",
      "distance": "2.5 km",
      "category": "Clinic"
    },
    {
      "image": "assets/images/hospital_3.png",
      "name": "Orthodic Surgery Center",
      "address": "555 Bridge Street, Golden Gate",
      "rating": "4.9",
      "reviews": "58",
      "distance": "2.5 km",
      "category": "Hospital"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: clinics.length,
      itemBuilder: (context, index) {
        return ClinicCard(
          imagePath: clinics[index]["image"]!,
          name: clinics[index]["name"]!,
          address: clinics[index]["address"]!,
          rating: clinics[index]["rating"]!,
          reviews: clinics[index]["reviews"]!,
          distance: clinics[index]["distance"]!,
          category: clinics[index]["category"]!,
        );
      },
    );
  }
}

class ClinicCard extends StatefulWidget {
  final String imagePath;
  final String name;
  final String address;
  final String rating;
  final String reviews;
  final String distance;
  final String category;

  const ClinicCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.address,
    required this.rating,
    required this.reviews,
    required this.distance,
    required this.category,
  });

  @override
  _ClinicCardState createState() => _ClinicCardState();
}

class _ClinicCardState extends State<ClinicCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(widget.imagePath,
                    fit: BoxFit.cover, width: double.infinity, height: 150),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: CircleAvatar(
                  backgroundColor: Colors.grey.shade50,
                  child: FavoriteButton(),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name, style: AppTypography.h2),
                SizedBox(height: 5),
                Row(children: [
                  Icon(Icons.location_on, size: 16, color: Colors.grey),
                  SizedBox(width: 5),
                  Expanded(
                      child: Text(widget.address,
                          style: AppTypography.bodySRegular)),
                ]),
                SizedBox(height: 5),
                Row(children: [
                  Icon(Icons.star, size: 16, color: Colors.orange),
                  Text(" ${widget.rating} ", style: AppTypography.bodySBold),
                  Text("(${widget.reviews} Reviews)",
                      style: AppTypography.bodySRegular),
                ]),
                SizedBox(height: 5),
                Row(children: [
                  Icon(Icons.directions_walk, size: 16, color: Colors.grey),
                  SizedBox(width: 5),
                  Text("${widget.distance} / 40 min",
                      style: AppTypography.bodySRegular),
                  Spacer(),
                  Icon(Icons.local_hospital, size: 16, color: Colors.grey),
                  SizedBox(width: 5),
                  Text(widget.category, style: AppTypography.bodySRegular),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
