import 'package:doctor_appointment_app/widget/map_hospital_card.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DoctorMapScreen extends StatefulWidget {
  const DoctorMapScreen({super.key});

  @override
  State<DoctorMapScreen> createState() => _DoctorMapScreenState();
}

class _DoctorMapScreenState extends State<DoctorMapScreen> {
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Custom Search Bar
          Positioned(
            top: 50,
            left: 16,
            right: 16,
            child: SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: SearchBar(
                textStyle: WidgetStateProperty.all(
                  const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                side: const WidgetStatePropertyAll(
                  BorderSide(
                      color: Color.fromARGB(255, 199, 197, 197), width: 0.01),
                ),
                hintText: 'Search doctor...',
                hintStyle: WidgetStateProperty.all(
                  const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side:
                        const BorderSide(style: BorderStyle.solid, width: 0.1),
                  ),
                ),
                backgroundColor:
                    WidgetStateProperty.all(const Color(0xFFF3F4F6)),
                shadowColor: WidgetStateProperty.all(Colors.transparent),
                leading: const Icon(Icons.search, color: Colors.grey),
              ),
            ),
          ),

          // Sliding Hospital Cards
          Positioned(
            bottom: 20,
            left: 16, // Adjusted from 0
            right: 16, // Adjusted from 0
            child: CarouselSlider(
              options: CarouselOptions(
                height: 323,
                enlargeCenterPage: true,
                viewportFraction: 0.85,
              ),
              items: clinics.map((clinic) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4.0), // Added padding
                  child: ClinicCard(
                    imagePath: clinic["image"]!,
                    name: clinic["name"]!,
                    address: clinic["address"]!,
                    rating: clinic["rating"]!,
                    reviews: clinic["reviews"]!,
                    distance: clinic["distance"]!,
                    category: clinic["category"]!,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
