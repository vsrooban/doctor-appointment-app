import 'package:doctor_appointment_app/screen/home/list_doctors_page.dart';
import 'package:doctor_appointment_app/screen/home/notification_screen.dart';
import 'package:doctor_appointment_app/util/custom_theme.dart';
import 'package:doctor_appointment_app/widget/home_screen_categories_widget.dart';
import 'package:doctor_appointment_app/widget/home_screen_slider_widget.dart';
import 'package:doctor_appointment_app/widget/nearby_clinics_widget.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location',
                    style: AppTypography.bodySMedium,
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset('assets/images/location_icon.png'),
                      SizedBox(width: 10),
                      Text(
                        'Seattle, USA',
                        style: AppTypography.bodySSemiBold,
                      ),
                    ],
                  ),
                ],
              ),
              CircleAvatar(
                backgroundColor: const Color(0xFFEEEDED),
                child: Stack(
                  children: [
                    InkWell(
                      hoverColor: Colors.transparent,
                      onTap: () {
                        Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const NotificationScreen(previousScreen: 'home')),
);

                      },
                      child: const Icon(
                        size: 24,
                        Icons.notifications,
                        color: Color(0xFF4B5563),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 3,
                      bottom: 16,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.red, width: 2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40,
          width: 352,
          child: SearchBar(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AllDoctorsPage()));
            },
            textStyle: WidgetStateProperty.all(
                AppTypography.bodySRegular.copyWith(color: Colors.grey)),
            side: const WidgetStatePropertyAll(BorderSide(
                color: Color.fromARGB(255, 199, 197, 197), width: 0.01)),
            hintText: 'Search doctor...',
            hintStyle: WidgetStateProperty.all(
                AppTypography.bodySRegular.copyWith(color: Colors.grey)),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(style: BorderStyle.solid, width: 0.1),
              ),
            ),
            backgroundColor: WidgetStateProperty.all(const Color(0xFFF3F4F6)),
            shadowColor: WidgetStateProperty.all(Colors.transparent),
            leading: Icon(Icons.search, color: Colors.grey),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 15),
                HomeScreenSliderWidget(),
                SizedBox(height: 15),
                HomeScreenCategoriesWidget(),
                // SizedBox(height: 15),
                NearbyClinicsWidget(),
                 SizedBox(height: 10),
              ],
            ),
          ),
        ),
        

      ],
    );
  }
}
