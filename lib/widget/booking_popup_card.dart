import 'package:doctor_appointment_app/screen/home/booking_screen.dart';
import 'package:doctor_appointment_app/util/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointmentConfirmationDialog extends StatefulWidget {
  final DateTime date;
  final String time;

  const AppointmentConfirmationDialog({
    super.key,
    required this.date,
    required this.time,
  });

  @override
  State<AppointmentConfirmationDialog> createState() => _AppointmentConfirmationDialogState();
}

class _AppointmentConfirmationDialogState extends State<AppointmentConfirmationDialog> {
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('MMMM dd, yyyy').format(widget.date); 

    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), 
      contentPadding: EdgeInsets.all(20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Center(child: Image.asset("assets/images/booking_done.png",height: 132,width: 132,)),
          const SizedBox(height: 20),
          Text("Congratulations!", style: AppTypography.h3, textAlign: TextAlign.center),
          const SizedBox(height: 10),
          Text(
            "Your appointment with Dr. David Patel is confirmed for $formattedDate, at ${widget.time}.",
            style: AppTypography.bodySMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 25),
          SizedBox(
            height: 48,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff1C2A3A),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> BookingScreen()));},
              child: Text("Done", style: AppTypography.button.copyWith(color: Colors.white)),
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Edit your appointment", style: AppTypography.bodySMedium.copyWith(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
