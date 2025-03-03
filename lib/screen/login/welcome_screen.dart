import 'package:doctor_appointment_app/screen/login/signin_screen.dart';
import 'package:doctor_appointment_app/util/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _currentSlide = 0;
  final CarouselSliderController _carouselController = CarouselSliderController();

  // List of slide content
  List<Widget> get _slides => [
        _buildSlide(
          imagePath: 'assets/images/doctor_2.png',
          title: 'Meet Doctors Online',
          description:
              'Connect with Specialized Doctors Online for Convenient and Comprehensive Medical Consultations.',
          onNext: () => _goToNextSlide(),
        ),
        _buildSlide(
          imagePath: 'assets/images/doctor_1.png',
          title: 'Connect with Specialists',
          description:
              'Connect with Specialized Doctors Online for Convenient and Comprehensive Medical Consultations.',
          onNext: () => _goToNextSlide(),
        ),
        _buildSlide(
          imagePath: 'assets/images/doctor_3.png',
          title: 'Thousands of Online Specialists',
          description:
              'Explore a Vast Array of Online Medical Specialists, Offering an Extensive Range of Expertise Tailored to Your Healthcare Needs.',
          onNext: () {
            // Navigate to sign-in on last slide
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SigninPage()),
            );
          },
        ),
      ];

  void _goToNextSlide() {
    if (_currentSlide < _slides.length - 1) {
      setState(() {
        _currentSlide++;
      });
      _carouselController.animateToPage(_currentSlide);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SigninPage()),
      );
    }
  }

  static Widget _buildSlide({
    required String imagePath,
    required String title,
    required String description,
    required VoidCallback onNext,
  }) {
    return Column(
      children: [
        Container(
          height: 532,
          width: 390,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 30),
        Container(
          alignment: Alignment.topCenter,
          height: 170,
          width: 311,
          child: Column(
            children: [
              Text(title, style: AppTypography.h2),
              SizedBox(height: 10),
              Text(
                description,
                textAlign: TextAlign.center,
                style: AppTypography.bodySSemiBold.copyWith(color: Colors.grey),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: onNext,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1C2A3A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  fixedSize: Size(311, 48),
                ),
                child: Text(
                  "Next",
                  style: AppTypography.bodySBold.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            CarouselSlider(
              items: _slides,
              carouselController: _carouselController,
              options: CarouselOptions(
                height: 750,
                viewportFraction: 1.0,autoPlayInterval: Duration(seconds: 2),
                enlargeCenterPage: false,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentSlide = index;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _slides.asMap().entries.map((entry) {
                return Container(
                  width: _currentSlide == entry.key ? 12.0 : 8.0,
                  height: _currentSlide == entry.key ? 12.0 : 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentSlide == entry.key ? Colors.black : Colors.grey,
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
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
      ),
    );
  }
}
