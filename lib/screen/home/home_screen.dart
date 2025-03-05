import 'package:doctor_appointment_app/screen/home/booking_screen.dart';
import 'package:doctor_appointment_app/screen/home/home_content.dart';
import 'package:doctor_appointment_app/screen/home/profile_screen.dart';
import 'package:doctor_appointment_app/util/custom_theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<String> _unselectedIcons = [
    'assets/images/home_outline_icon.png',
    'assets/images/location_outline_icon.png',
    'assets/images/calendar_outline_icon.png',
    'assets/images/profile_outline_icon.png',
  ];

  final List<String> _selectedIcons = [
    'assets/images/home_filled_icon.png',
    'assets/images/location_filled_icon.png',
    'assets/images/calendar_filled_icon.png',
    'assets/images/profile_filled_icon.png',
  ];

  final List<Widget> _screens = [
    HomeContent(),
    MapPage(),
    BookingScreen(),
    ProfileScreen(),
  ];

  Widget _buildNavItem(int index) {
    bool isSelected = _selectedIndex == index;
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected
            ? Color.fromARGB(255, 243, 244, 244)
            : Colors.transparent,
      ),
      child: Image.asset(

        isSelected ? _selectedIcons[index] : _unselectedIcons[index],
        width: 24,
        height: 24,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: List.generate(4, (index) => BottomNavigationBarItem(
          icon: _buildNavItem(index),
          label: "",
        )),
      ),
    );
  }
}

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Map Page", style: AppTypography.h2),
    );
  }
}

class DatePage extends StatefulWidget {
  const DatePage({super.key});

  @override
  State<DatePage> createState() => _DatePageState();
}

class _DatePageState extends State<DatePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Date Page", style: AppTypography.h2),
    );
  }
}
