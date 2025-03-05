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
          Center(child: Image.asset("assets/images/booking_done.png",height: 132,width: 132,)),
          const SizedBox(height: 16),
          Text("Congratulations!", style: AppTypography.h1, textAlign: TextAlign.center),
          const SizedBox(height: 8),
          Text(
            "Your appointment with Dr. David Patel is confirmed for $formattedDate, at ${widget.time}.",
            style: AppTypography.h4,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Done", style: AppTypography.button.copyWith(color: Colors.white)),
            ),
          ),

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
