import 'package:doctor_appointment_app/util/custom_theme.dart';
import 'package:doctor_appointment_app/widget/booking_calendar.dart';
import 'package:doctor_appointment_app/widget/booking_popup_card.dart';
import 'package:flutter/material.dart';

class AppointmentBookingScreen extends StatefulWidget {
  const AppointmentBookingScreen({super.key});

  @override
  State<AppointmentBookingScreen> createState() =>
      _AppointmentBookingScreenState();
}

class _AppointmentBookingScreenState extends State<AppointmentBookingScreen> {
  DateTime selectedDate = DateTime.now();
  String? selectedTime;

  final List<String> timeSlots = [
    "09.00 AM",
    "09.30 AM",
    "10.00 AM",
    "10.30 AM",
    "12.00 PM",
    "12.30 PM",
    "03.00 PM",
    "03.30 PM",
    "04.00 PM",
    "04.30 PM",
    "05.00 PM",
    "05.30 PM"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, size: 24),
                    ),
                    const Spacer(),
                    Text('Book Appointment', style: AppTypography.h1),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Select Date', style: AppTypography.h3),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: BookingCalendar(
                    onDateSelected: (date) {
                      setState(() {
                        selectedDate = date;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Select Hour', style: AppTypography.h3),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 18,
                    children: timeSlots.map((time) {
                      bool isSelected = time == selectedTime;
                      return GestureDetector(
                        onTap: () => setState(() => selectedTime = time),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 18),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Color(0xff1C2A3A)
                                : Color(0xffF9FAFB),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            time,
                            style: isSelected
                                ? AppTypography.bodySBold
                                    .copyWith(color: Colors.white)
                                : AppTypography.bodySRegular
                                    .copyWith(color: Colors.black),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                    child: SizedBox(
                      height: 48,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff1C2A3A),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {
                          if (selectedTime != null) {
                            showDialog(
                              context: context,
                              builder: (context) =>
                                  AppointmentConfirmationDialog(
                                date: selectedDate,
                                time: selectedTime!,
                              ),
                            );
                          }
                        },
                        child: Text("Confirm",
                            style: AppTypography.button
                                .copyWith(color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
