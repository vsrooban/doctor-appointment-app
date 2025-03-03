import 'package:doctor_appointment_app/screen/login/signin_screen.dart';
import 'package:doctor_appointment_app/util/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _currentSlide = 0;

  final List<Map<String, String>> slides = [
    {
      'imagePath': 'assets/images/doctor_2.png',
      'title': 'Meet Doctors Online',
      'description':
          'Connect with Specialized Doctors Online for Convenient and Comprehensive Medical Consultations.',
    },
    {
      'imagePath': 'assets/images/doctor_1.png',
      'title': 'Connect with Specialists',
      'description':
          'Connect with Specialized Doctors Online for Convenient and Comprehensive Medical Consultations.',
    },
    {
      'imagePath': 'assets/images/doctor_3.png',
      'title': 'Thousands of Online Specialists',
      'description':
          'Explore a Vast Array of Online Medical Specialists, Offering an Extensive Range of Expertise Tailored to Your Healthcare Needs.',
    },
  ];

  void _onSlideChange(int index) {
    setState(() {
      _currentSlide = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ImageSlideshow(
              
              width: double.infinity,
              indicatorBottomPadding: 10,
              // height: MediaQuery.of(context).size.height * 0.50,
              autoPlayInterval: 2000,
              isLoop: true,
              onPageChanged: _onSlideChange,
              children: slides.map((slide) {
                return _buildSlide(
                  imagePath: slide['imagePath']!,
                  title: slide['title']!,
                  description: slide['description']!,
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 10),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SigninPage()),
              );
            },
            child: Text(
              'Skip',
              style: AppTypography.bodySBold.copyWith(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlide({
    required String imagePath,
    required String title,
    required String description,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 70,
          child: Image.asset(
            imagePath,
            // height: MediaQuery.of(context).size.height * 0.95,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          flex: 30,
          child: Container(
            alignment: Alignment.topCenter,
            width: 311,
            child: Column(
              children: [
                SizedBox(height: 10),
                Text(title, style: AppTypography.h2),
                SizedBox(height: 10),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style:
                      AppTypography.bodySSemiBold.copyWith(color: Colors.grey),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_currentSlide < slides.length - 1) {
                      _onSlideChange(_currentSlide + 1);
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SigninPage()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1C2A3A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    fixedSize: Size(311, 48),
                  ),
                  child: Text(
                    "Next",
                    style:
                        AppTypography.bodySBold.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
