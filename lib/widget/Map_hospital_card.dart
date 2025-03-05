import 'package:doctor_appointment_app/widget/screen_favourite_button.dart';
import 'package:flutter/material.dart';
import 'package:doctor_appointment_app/util/custom_theme.dart';

class MapHospitalCard extends StatefulWidget {
  const MapHospitalCard({super.key});

  @override
  _MapHospitalCardState createState() => _MapHospitalCardState();
}

class _MapHospitalCardState extends State<MapHospitalCard> {
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
    double rating = double.tryParse(widget.rating) ?? 0.0; // Convert rating to double

    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.asset(widget.imagePath,
                      fit: BoxFit.cover, width: double.infinity, height: 100),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(73, 210, 212, 214),
                    child: ScreenFavouriteButton(),
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
                  Row(
                    children: [
                      Text(" ${widget.rating} ", style: AppTypography.bodySBold),
                      SizedBox(width: 4),
                      ...List.generate(
                        rating.floor(),
                        (index) =>
                            Icon(Icons.star, size: 16, color: Colors.orange),
                      ),
                      
                      if (rating % 1 != 0)
                        Icon(Icons.star_half, size: 16, color: Colors.orange),
                      
                      ...List.generate(
                        5 - rating.ceil(),
                        (index) => Icon(Icons.star_border,
                            size: 16, color: Colors.orange),
                      ),
                      SizedBox(width: 4), 
                      Text("(${widget.reviews} Reviews)",
                          style: AppTypography.bodySRegular),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(
                thickness: 1,
                color: const Color(0xFFE5E7EB),
              ),
                  Row(children: [
                    Image.asset("assets/images/routing.png"),
                    SizedBox(width: 5),
                    Text("${widget.distance} / 40 min",
                        style: AppTypography.bodySRegular),
                    Spacer(),
                    Image.asset("assets/images/icon_hospital_card.png"),
                    SizedBox(width: 5),
                    Text(widget.category, style: AppTypography.bodySRegular),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
