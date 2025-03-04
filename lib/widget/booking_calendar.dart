import 'package:flutter/material.dart';

class BookingCalendar extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const BookingCalendar({super.key, required this.onDateSelected});

  @override
  _BookingCalendarState createState() => _BookingCalendarState();
}

class _BookingCalendarState extends State<BookingCalendar> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 269,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        color: const Color(0xffF9FAFB),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Color(0xff1C2A3A),
                onPrimary: Colors.white,
                onSurface: Color(0xff6B7280),
              ),
              textTheme: const TextTheme(
                bodyLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                bodyMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ),
            child: CalendarDatePicker(
              initialDate: selectedDate,
              firstDate: DateTime.now(),
              lastDate: DateTime(2030),
              onDateChanged: (date) {
                setState(() => selectedDate = date);
                widget.onDateSelected(date);  // Send the selected date to parent
              },
            ),
          ),
        ),
      ),
    );
  }
}
