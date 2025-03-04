import 'package:doctor_appointment_app/screen/home/list_doctors_page.dart';
import 'package:doctor_appointment_app/util/custom_theme.dart';
import 'package:doctor_appointment_app/widget/doctor_details_card_widget.dart';
import 'package:doctor_appointment_app/widget/experience_widget.dart';
import 'package:doctor_appointment_app/widget/favourite_button.dart';
import 'package:flutter/material.dart';

class DoctorDetailsScreen extends StatefulWidget {
  const DoctorDetailsScreen({super.key});

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllDoctorsPage()));
                    },
                    icon: Icon(Icons.arrow_back)),
                Text(
                  'Doctor Details',
                  style: AppTypography.h1,
                ),
                SizedBox(
                  height: 20,
                  width: 20,
                  child: FavoriteButton(),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            DoctorDetailsCardWidget(),
            SizedBox(
              height: 15,
            ),
            ExperienceWidget(),
            SizedBox(
              height: 15,
            ),
            Text(
              'About me',
              style: AppTypography.h1,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Dr. David Patel, a dedicated cardiologist, brings a wealth of experience to Golden Gate Cardiology Center in Golden Gate, CA. view more',
              style:
                  AppTypography.bodySRegular.copyWith(color: Color(0xFF6B7280)),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Working Time',
              style: AppTypography.h1,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Monday-Friday, 08.00 AM-18.00 pM',
              style:
                  AppTypography.bodySRegular.copyWith(color: Color(0xFF6B7280)),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Reviews',
                  style: AppTypography.h1,
                ),
                Text(
                  'See All',
                  style: AppTypography.bodySMedium.copyWith(color: Colors.grey),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Image.asset('assets/images/review_image_1.png'),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Emily Anderson',
                      style: AppTypography.h3,
                    ),
                    Row(
                      children: [
                        Text('5.0'),
                        const Icon(Icons.star, color: Colors.amber, size: 14),
                        const Icon(Icons.star, color: Colors.amber, size: 14),
                        const Icon(Icons.star, color: Colors.amber, size: 14),
                        const Icon(Icons.star, color: Colors.amber, size: 14),
                        const Icon(Icons.star, color: Colors.amber, size: 14),
                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Dr. Patel is a true professional who genuinely cares about his patients. I highly recommend Dr. Patel to anyone seeking exceptional cardiac care.',
              style:
                  AppTypography.bodySRegular.copyWith(color: Color(0xFF6B7280)),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 342,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1C2A3A),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
                child: Text("Booking Appointment",
                    style:
                        AppTypography.bodySBold.copyWith(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
