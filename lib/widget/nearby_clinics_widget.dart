import 'package:doctor_appointment_app/util/custom_theme.dart';
import 'package:flutter/material.dart';

class NearbyClinicsWidget extends StatefulWidget {
  const NearbyClinicsWidget({super.key});

  @override
  State<NearbyClinicsWidget> createState() => _NearbyClinicsWidgetState();
}

class _NearbyClinicsWidgetState extends State<NearbyClinicsWidget> {
  final List<Map<String, String>> clinics = [
    {"image": "assets/images/hospital_1.png", "name": "Sunrise Health Clinic"},
    {"image": "assets/images/hospital_2.png", "name": "City Care Hospital"},
    {"image": "assets/images/hospital_3.png", "name": "Green Valley Clinic"},
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
        Padding(
          padding: const EdgeInsets.only(left: 1),
          child: SizedBox(
            height: 150,
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              addAutomaticKeepAlives: false,
              scrollDirection: Axis.horizontal,
              itemCount: clinics.length,
              itemBuilder: (context, index) {
                return ClinicCard(
                  imagePath: clinics[index]["image"]!,
                  name: clinics[index]["name"]!,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class ClinicCard extends StatefulWidget {
  final String imagePath;
  final String name;

  const ClinicCard({super.key, required this.imagePath, required this.name});

  @override
  State<ClinicCard> createState() => _ClinicCardState();
}

class _ClinicCardState extends State<ClinicCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      height: 151,
      width: 232,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
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
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.asset(
              widget.imagePath,
              height: 121,
              width: 232,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              widget.name,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Color(0xFF4B5563),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
