import 'package:doctor_appointment_app/util/custom_theme.dart';
import 'package:doctor_appointment_app/widget/completed_widget.dart';
import 'package:doctor_appointment_app/widget/upcoming_widget.dart';
import 'package:doctor_appointment_app/widget/canceled_widget.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int selectedIndex = 0;
  final List<String> sections = ["Upcoming", "Completed", "Canceled"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 40),
          Container(
            alignment: Alignment.center,
            child: Text(
              'My Bookings',
              style: AppTypography.h2,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(sections.length, (index) {
              return GestureDetector(
                onTap: () => setState(() => selectedIndex = index),
                child: Column(
                  children: [
                    Text(
                      sections[index],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: selectedIndex == index
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color:
                            selectedIndex == index ? Colors.black : Colors.grey,
                      ),
                    ),
                    if (selectedIndex == index)
                      Container(
                          margin: const EdgeInsets.only(top: 4),
                          height: 3,
                          width: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4),
                                topRight: Radius.circular(4)),
                            color: const Color(0xFF1C2A3A),
                          )),
                  ],
                ),
              );
            }),
          ),
          Container(
            height: 1,
            color: Color(0xFFE5E7EB),
          ),
          Expanded(
            child: IndexedStack(
              index: selectedIndex,
              children: const [
                UpcomingWidget(),
                CompletedWidget(),
                CanceledWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
