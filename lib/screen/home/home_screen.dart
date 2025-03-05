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
  Widget _buildNavItem(IconData icon, int index) {
    bool isSelected = _selectedIndex == index;
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected
            ? Color.fromARGB(255, 243, 244, 244)
            : Colors.transparent,
      ),
      child: Icon(
        icon,
        size: 30,
        color: isSelected ? const Color.fromARGB(255, 86, 85, 85) : Colors.grey,
      ),
    );
  }

  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeContent(),
    MapPage(),
    BookingScreen(),
    ProfileScreen(),
  ];

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
        items: [
          BottomNavigationBarItem(
            icon: _buildNavItem(Icons.home, 0),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: _buildNavItem(Icons.location_on, 1),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: _buildNavItem(Icons.calendar_month, 2),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: _buildNavItem(Icons.person, 3),
            label: "",
          ),
        ],
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
