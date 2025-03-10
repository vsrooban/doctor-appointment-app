import 'package:doctor_appointment_app/screen/home/booking_screen.dart';
import 'package:doctor_appointment_app/screen/home/home_content.dart';
import 'package:doctor_appointment_app/screen/home/map_screen.dart';
import 'package:doctor_appointment_app/screen/home/profile_screen.dart';
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
    DoctorMapScreen(),
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
    return PopScope(
      canPop: _selectedIndex == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && _selectedIndex != 0) {
          setState(() {
            _selectedIndex = 0;
          });
        }
      },
      child: Scaffold(
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
          items: List.generate(
              4,
              (index) => BottomNavigationBarItem(
                    icon: _buildNavItem(index),
                    label: "",
                  )),
        ),
      ),
    );
  }
}
