import 'package:doctor_appointment_app/util/custom_theme.dart';
import 'package:doctor_appointment_app/widget/favourite_button.dart';
import 'package:flutter/material.dart';

class DoctorsListCard extends StatefulWidget {
  const DoctorsListCard({
    super.key,
    required this.doctors,
  });

  final List<Map<String, String>> doctors;

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
                  width: 95,
                  height: 120,
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
                          Text(doctor['name']!, style: AppTypography.bodyLG),
                          const FavoriteButton(),
                        ],
                      ),
                      const Divider(thickness: .3, color: Colors.grey),
                      Text(doctor['specialty']!, style: AppTypography.bodySBold),
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined, size: 12),
                          Text(doctor['hospital']!, style: AppTypography.bodySRegular),
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
        );
      },
    );
  }
}