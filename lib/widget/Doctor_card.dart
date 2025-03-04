import 'package:doctor_appointment_app/screen/home/doctor_details_screen.dart';
import 'package:doctor_appointment_app/util/custom_theme.dart';
import 'package:doctor_appointment_app/widget/favourite_button.dart';
import 'package:flutter/material.dart';

class DoctorsListCard extends StatefulWidget {
   DoctorsListCard({
    super.key,
  });

  
  final List<Map<String, String>> doctors = [
    {
      "name": "Dr. David Patel",
      "specialty": "Cardiologist",
      "hospital": "Cardiology Center, USA",
      "rating": "5.0",
      "reviews": "1,872 Reviews",
      "image": "assets/images/doctor_4.png",
    },
    {
      "name": "Dr. Jessica Turner",
      "specialty": "Gynecologist",
      "hospital": "Women's Clinic, Seattle, USA",
      "rating": "4.9",
      "reviews": "127 Reviews",
      "image": "assets/images/doctor_2.png",
    },
    {
      "name": "Dr. Michael Johnson",
      "specialty": "Orthopedic Surgery",
      "hospital": "Maple Associates, NY, USA",
      "rating": "4.7",
      "reviews": "5,223 Reviews",
      "image": "assets/images/doctor_3.png",
    },
    {
      "name": "Dr. Emily Walker",
      "specialty": "Pediatrics",
      "hospital": "Serenity Pediatrics's Clinic",
      "rating": "5",
      "reviews": "405 Reviews",
      "image": "assets/images/doctor_1.png",
    },
    {
      "name": "Dr. Emma Green",
      "specialty": "Gynecologist",
      "hospital": "Bernard Clinic",
      "rating": "5",
      "reviews": "405 Reviews",
      "image": "assets/images/doctor_5.png",
    },
  ];

  @override
  State<DoctorsListCard> createState() => _DoctorsListCardState();
}

class _DoctorsListCardState extends State<DoctorsListCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.doctors.length,
      itemBuilder: (context, index) {
        final doctor = widget.doctors[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorDetailsScreen()));
          },
          child: Card(
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
                    width: 109,
                    height: 109,
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
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Text(doctor['name']!, style: AppTypography.h3),
                            const FavoriteButton(),
                          ],
                        ),
                        const Divider(thickness: .9, color: Colors.grey),
                        Text(doctor['specialty']!, style: AppTypography.bodyLG),
                        Row(
                          children: [
                            const Icon(Icons.location_on_outlined, size: 12),
                            Text(doctor['hospital']!, style: AppTypography.bodySMedium),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 14),
                            Text(
                              ' ${doctor['rating']} | ${doctor['reviews']}',
                              style: AppTypography.bodyXSRegular,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}