import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomeScreenSliderWidget extends StatefulWidget {
  const HomeScreenSliderWidget({super.key});

  @override
  _HomeScreenSliderWidgetState createState() => _HomeScreenSliderWidgetState();
}

class _HomeScreenSliderWidgetState extends State<HomeScreenSliderWidget> {
  final List<Widget> _slides = [
    _buildSlide(
        imagePath: 'assets/images/home_page_slider_1.png',
        firstTitle: 'Looking for',
        secondTitle: 'Specialist Doctors?',
        firstSubtitle: 'Schedule an appointment with',
        secondSubtitle: 'our top doctors.'),
    _buildSlide(
        imagePath: 'assets/images/home_page_slider_2.png',
        firstTitle: 'Looking for',
        secondTitle: 'Specialist Doctors?',
        firstSubtitle: 'Schedule an appointment with',
        secondSubtitle: 'our top doctors.'),
    _buildSlide(
        imagePath: 'assets/images/home_page_slider_3.png',
        firstTitle: 'Looking for',
        secondTitle: 'Specialist Doctors?',
        firstSubtitle: 'Schedule an appointment with',
        secondSubtitle: 'our top doctors.'),
    _buildSlide(
        imagePath: 'assets/images/home_page_slider_4.png',
        firstTitle: 'Looking for',
        secondTitle: 'Specialist Doctors?',
        firstSubtitle: 'Schedule an appointment with',
        secondSubtitle: 'our top doctors.'),
  ];

  static Widget _buildSlide({
    required String imagePath,
    required String firstTitle,
    required String secondTitle,
    required String firstSubtitle,
    required String secondSubtitle,
  }) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 163,
              width: 382,
            ),
          ),
          Positioned(
            left: 20,
            bottom: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  firstTitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  secondTitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  firstSubtitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Text(
                  secondSubtitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageSlideshow(
          indicatorRadius: 5,
          width: double.infinity,
          height: 180,
          initialPage: 0,
          indicatorColor: Colors.white,
          indicatorBackgroundColor: Colors.grey,
          autoPlayInterval: 3000,
          isLoop: true,
          indicatorBottomPadding: 15,
          children: _slides,
        ),
      ],
    );
  }
}
