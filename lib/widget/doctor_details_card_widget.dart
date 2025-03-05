import 'package:doctor_appointment_app/util/custom_theme.dart';
import 'package:flutter/material.dart';

class DoctorDetailsCardWidget extends StatelessWidget {
  DoctorDetailsCardWidget({super.key});

  final Map<String, String> doctor = {
    "name": "Dr. David Patel",
    "specialty": "Cardiologist",
    "hospital": "Cardiology Center, USA",
    "image": "assets/images/doctor_4.png",
  };

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: .9, vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
                image: DecorationImage(
                  image: AssetImage(doctor['image']!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(doctor['name']!, style: AppTypography.h3),
                  Divider(

                    thickness: 1,
                    color: const Color(0xFFE5E7EB),
                  ),

                  Text(doctor['specialty']!, style: AppTypography.bodySBold),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, size: 12),
                      Text(doctor['hospital']!,
                          style: AppTypography.bodySRegular),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
