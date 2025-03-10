import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingCalendar extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const BookingCalendar({super.key, required this.onDateSelected});

  @override
  _BookingCalendarState createState() => _BookingCalendarState();
}

class _BookingCalendarState extends State<BookingCalendar> {
  DateTime selectedDate = DateTime.now();
  DateTime currentMonth = DateTime.now();

  void _changeMonth(int delta) {
    setState(() {
      currentMonth = DateTime(currentMonth.year, currentMonth.month + delta, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
        color: const Color(0xffF9FAFB),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    DateFormat.yMMMM().format(currentMonth),
                    style: const TextStyle(
                      color: Color(0xff111827),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon:
                        const Icon(Icons.arrow_left, color: Color(0xff111827)),
                    onPressed: () => _changeMonth(-1),
                  ),
                  IconButton(
                    icon:
                        const Icon(Icons.arrow_right, color: Color(0xff111827)),
                    onPressed: () => _changeMonth(1),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
                    .map((day) => Text(
                          day,
                          style: const TextStyle(
                            color: Color(0xff6B7280),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ))
                    .toList(),
              ),
              Expanded(
                child: _buildCalendarGrid(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalendarGrid() {
    DateTime firstDayOfMonth =
        DateTime(currentMonth.year, currentMonth.month, 1);
    int startingWeekday = firstDayOfMonth.weekday % 7;
    int daysInMonth =
        DateTime(currentMonth.year, currentMonth.month + 1, 0).day;
    int totalDays = 42;

    int prevMonthDays = DateTime(currentMonth.year, currentMonth.month, 0).day;
    int prevMonthStart = prevMonthDays - startingWeekday + 1;

    List<Widget> dayWidgets = [];
    int dayCounter = 1;
    int nextMonthDay = 1;

    for (int i = 0; i < totalDays; i++) {
      DateTime thisDate;
      bool isSelected;

      if (i < startingWeekday) {
        thisDate = DateTime(
            currentMonth.year, currentMonth.month - 1, prevMonthStart + i);
        isSelected = false;
      } else if (dayCounter <= daysInMonth) {
        thisDate = DateTime(currentMonth.year, currentMonth.month, dayCounter);
        isSelected = selectedDate.year == thisDate.year &&
            selectedDate.month == thisDate.month &&
            selectedDate.day == thisDate.day;
        dayCounter++;
      } else {
        thisDate =
            DateTime(currentMonth.year, currentMonth.month + 1, nextMonthDay++);
        isSelected = false;
      }

      dayWidgets.add(
        GestureDetector(
          onTap: () {
            if (thisDate.month == currentMonth.month) {
              setState(() {
                selectedDate = thisDate;
              });
              widget.onDateSelected(selectedDate);
            }
          },
          child: Container(
            margin: const EdgeInsets.all(1),
            width: 18,
            height: 18,
            alignment: Alignment.center,
            decoration: isSelected
                ? BoxDecoration(
                    color: const Color(0xff1C2A3A),
                    borderRadius: BorderRadius.circular(4),
                  )
                : null,
            child: Text(
              '${thisDate.day}',
              style: TextStyle(
                fontSize: 10,
                color: thisDate.month == currentMonth.month
                    ? (isSelected ? Colors.white : const Color(0xff111827))
                    : const Color(0xff9CA3AF),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }

    return GridView.count(
      crossAxisCount: 7,
      childAspectRatio: 1.65,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: dayWidgets,
    );
  }
}
