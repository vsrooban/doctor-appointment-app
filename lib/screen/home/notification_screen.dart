import 'package:doctor_appointment_app/screen/home/home_screen.dart';
import 'package:doctor_appointment_app/util/custom_theme.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final String previousScreen; // Declare previousScreen

  const NotificationScreen({super.key, required this.previousScreen}); // Require it in constructor

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Notification", style: AppTypography.h2),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              _handleBackNavigation(context); // Call function
            },
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0xff4B5563),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Text(
                "1 New",
                style: AppTypography.bodySRegular.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildSectionHeader("TODAY"),
            _buildNotificationItem(Icons.event_available, "Appointment Success", "You have successfully booked your appointment with Dr. Emily Walker.", "1h", Colors.green),
            _buildNotificationItem(Icons.cancel, "Appointment Cancelled", "You have successfully cancelled your appointment with Dr. David Patel.", "2h", Colors.red),
            _buildNotificationItem(Icons.schedule, "Schedule Changed", "You have successfully changed your appointment with Dr. Jesica Turner.", "8h", Colors.grey),
            const SizedBox(height: 15),
            _buildSectionHeader("YESTERDAY"),
            _buildNotificationItem(Icons.event_available, "Appointment Success", "You have successfully booked your appointment with Dr. David Patel.", "1d", Colors.green),
            _buildNotificationItem(Icons.schedule, "Schedule Changed", "You have successfully changed your appointment with Dr. Jesica Turner.", "8h", Colors.grey),
          ],
        ),
      ),
    );
  }

  void _handleBackNavigation(BuildContext context) {
    if (previousScreen == 'home') {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
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
          Text("Mark all as read", style: AppTypography.bodySBold.copyWith(color: Colors.black)),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(IconData icon, String title, String subtitle, String time, Color iconColor) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: iconColor.withValues(alpha:  0.2),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(title, style: AppTypography.bodySBold),
      subtitle: Text(subtitle, style: AppTypography.bodySRegular),
      trailing: Text(time, style: AppTypography.bodyXSRegular.copyWith(color: Colors.grey)),
      contentPadding: const EdgeInsets.symmetric(vertical: 5),
    );
  }
}
