import 'package:doctor_appointment_app/screen/home/home_screen.dart';
import 'package:doctor_appointment_app/util/custom_theme.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  final String previousScreen;

  const NotificationScreen({super.key, required this.previousScreen});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  _handleBackNavigation(context);
                },
              ),
              Text('Notification', style: AppTypography.h1),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0xff4B5563),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Text(
                  "1 New",
                  style:
                      AppTypography.bodySRegular.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _buildSectionHeader("TODAY"),
          _buildNotificationItem(
              "assets/images/calendar-tick.png",
              "Appointment Success",
              "You have successfully booked your appointment with Dr. Emily Walker.",
              "1h",
              Colors.green),
          _buildNotificationItem(
              "assets/images/calendar-remove.png",
              "Appointment Cancelled",
              "You have successfully cancelled your appointment with Dr. David Patel.",
              "2h",
              Colors.red),
          _buildNotificationItem(
              "assets/images/calendar-edit.png",
              "Scheduled Changed",
              "You have successfully changed your appointment with Dr. Jesica Turner.",
              "8h",
              Colors.grey),
          const SizedBox(height: 15),
          _buildSectionHeader("YESTERDAY"),
          _buildNotificationItem(
              "assets/images/calendar-tick.png",
              "Appointment Success",
              "You have successfully booked your appointment with Dr. David Patel.",
              "1d",
              Colors.green),
          // _buildNotificationItem(
          //     "assets/images/calendar-edit.png",
          //     "Schedule Changed",
          //     "You have successfully changed your appointment with Dr. Jesica Turner.",
          //     "8h",
          //     Colors.grey),
        ],
      ),
    );
  }

  void _handleBackNavigation(BuildContext context) {
    if (widget.previousScreen == 'home') {
      Navigator.pop(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      Navigator.pop(context);
    }
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTypography.h3.copyWith(color: Colors.black54)),
          Text("Mark all as read",
              style: AppTypography.bodySBold.copyWith(color: Colors.black)),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(String imagePath, String title, String subtitle,
      String time, Color iconColor) {
    return ListTile(
      leading: CircleAvatar(
        radius: 35,
        child: Image.asset(
          imagePath,
          width: 60,
          height: 60,
        ),
      ),
      title: Text(title, style: AppTypography.bodyLG),
      subtitle: Text(subtitle,
          style: AppTypography.bodySMedium.copyWith(color: Colors.grey)),
      trailing: Text(time,
          style: AppTypography.bodySRegular.copyWith(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          )),
      contentPadding: const EdgeInsets.symmetric(vertical: 15),
    );
  }
}
