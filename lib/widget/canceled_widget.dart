import 'package:flutter/material.dart';

class CanceledWidget extends StatefulWidget {
  const CanceledWidget({super.key});

  @override
  State<CanceledWidget> createState() => _CanceledWidgetState();
}

class _CanceledWidgetState extends State<CanceledWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No Canceled Appointments',
        style: TextStyle(fontSize: 18, color: Colors.grey),
      ),
    );
  }
}
