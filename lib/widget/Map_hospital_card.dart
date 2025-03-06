import 'package:doctor_appointment_app/util/custom_theme.dart';
import 'package:flutter/material.dart';

class HorizontalClinicList extends StatefulWidget {
  const HorizontalClinicList({super.key});

  @override
  State<HorizontalClinicList> createState() => _HorizontalClinicListState();
}

class _HorizontalClinicListState extends State<HorizontalClinicList> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Nearby Medical Centers',
              style: AppTypography.h3,
            ),
            Text(
              'See All',
              style: AppTypography.bodySMedium.copyWith(color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: ListView(
      
            scrollDirection: Axis.horizontal,
            children: clinics.map((clinic) {
              return ClinicCard(
                imagePath: clinic["image"]!,
                name: clinic["name"]!,
                address: clinic["address"]!,
                rating: clinic["rating"]!,
                reviews: clinic["reviews"]!,
                distance: clinic["distance"]!,
                category: clinic["category"]!,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class ClinicCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    double parsedRating = double.tryParse(rating) ?? 0.0;

    return Container(
      // margin: const EdgeInsets.only(right: 5),
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.asset(
              imagePath,
              height: 121,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppTypography.h4.copyWith(color: Color(0xFF4B5563))),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 16, color: Colors.grey),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(address, style: AppTypography.bodyXSBold.copyWith(color: Color(0xFF6B7280))),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Text(" $rating ", style: AppTypography.bodySBold.copyWith(color: Color(0xFF6B7280))),
                    ...List.generate(
                      parsedRating.floor(),
                      (index) =>
                          Icon(Icons.star, size: 16, color: Colors.orange),
                    ),
                    if (parsedRating % 1 != 0)
                      Icon(Icons.star_half, size: 16, color: Colors.orange),
                    ...List.generate(
                      5 - parsedRating.ceil(),
                      (index) => Icon(Icons.star_border,
                          size: 16, color: Colors.orange),
                    ),
                    const SizedBox(width: 4),
                    Text("($reviews Reviews)",
                        style: AppTypography.bodyXSBold.copyWith(color: Color(0xFF6B7280))),
                  ],
                ),
                const SizedBox(height: 5),
                Divider(thickness: 1, color: const Color(0xFFE5E7EB)),
                Row(
                  children: [
                    Image.asset("assets/images/routing.png"),
                    const SizedBox(width: 5),
                    Text("$distance / 40 min",
                        style: AppTypography.bodyXSBold.copyWith(color: Color(0xFF6B7280))),
                    const Spacer(),
                    Image.asset("assets/images/icon_hospital_card.png"),
                    const SizedBox(width: 5),
                    Text(category, style: AppTypography.bodyXSBold.copyWith(color: Color(0xFF6B7280))),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
