import 'package:doctor_appointment_app/util/custom_theme.dart';
import 'package:flutter/material.dart';

class CompletedWidget extends StatefulWidget {
  const CompletedWidget({super.key});

  @override
  State<CompletedWidget> createState() => _CompletedWidgetState();
}

class _CompletedWidgetState extends State<CompletedWidget> {
  final List<Map<String, String>> doctors = const [
    {
      "date": "May 22, 2023 - 10.00 AM",
      "name": "Dr. David Patel",
      "specialty": "Cardiologist",
      "hospital": "Cardiology Center, USA",
      "rating": "5.0",
      "reviews": "1,872 Reviews",
      "image": "assets/images/doctor_4.png"
    },
    {
      "date": "May 22, 2023 - 10.00 AM",
      "name": "Dr. Jessica Turner",
      "specialty": "Gynecologist",
      "hospital": "Women's Clinic, Seattle, USA",
      "rating": "4.9",
      "reviews": "127 Reviews",
      "image": "assets/images/doctor_2.png"
    },
    {
      "date": "May 22, 2023 - 10.00 AM",
      "name": "Dr. Michael Johnson",
      "specialty": "Orthopedic Surgery",
      "hospital": "Maple Associates, NY, USA",
      "rating": "4.7",
      "reviews": "5,223 Reviews",
      "image": "assets/images/doctor_3.png"
    },
    {
      "date": "May 22, 2023 - 10.00 AM",
      "name": "Dr. Emily Walker",
      "specialty": "Pediatrics",
      "hospital": "Serenity Pediatrics's Clinic",
      "rating": "5",
      "reviews": "405 Reviews",
      "image": "assets/images/doctor_1.png"
    },
    {
      "date": "May 22, 2023 - 10.00 AM",
      "name": "Dr. Emma Green",
      "specialty": "Gynecologist",
      "hospital": "Bernard Clinic",
      "rating": "5",
      "reviews": "405 Reviews",
      "image": "assets/images/doctor_5.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: doctors.length,
      itemBuilder: (context, index) => DoctorCard(doctor: doctors[index]),
    );
  }
}

class DoctorCard extends StatefulWidget {
  final Map<String, String> doctor;

  const DoctorCard({super.key, required this.doctor});

  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doctor['date']!,
              style: AppTypography.h3,
            ),
            Divider(
              thickness: 1,
              color: const Color(0xFFE5E7EB),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    widget.doctor['image']!,
                    width: 109,
                    height: 109,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.doctor['name']!,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.doctor['specialty']!,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Image.asset('assets/images/location.png'),
                          Text(
                            widget.doctor['hospital']!,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              thickness: 1,
              color: const Color(0xFFE5E7EB),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 37,
                  width: 147,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE5E7EB),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    child: Text("Re-Book",
                        style: AppTypography.bodySBold
                            .copyWith(color: const Color(0xFF1C2A3A))),
                  ),
                ),
                // SizedBox(
                //   width: 30,
                // ),
                SizedBox(
                  height: 37,
                  width: 147,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1C2A3A),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    child: Text("Add Review",
                        style: AppTypography.bodySBold
                            .copyWith(color: Colors.white)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
