import 'package:doctor_appointment_app/screen/home/home_content.dart';
import 'package:doctor_appointment_app/util/custom_theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Track the selected tab index

  // List of screens to switch between
  final List<Widget> _screens = [
    HomeContent(), 
    MapPage(), 
    DatePage(), 
    ProfilePage(), 
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
      body: _screens[_selectedIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Color(0xFF1C2A3A), // Active icon color
        unselectedItemColor: Colors.grey, // Inactive icon color
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed, // Prevent shifting effect
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on, size: 30),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month, size: 30),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30),
            label: "",
          ),
        ],
      ),
    );
  }
}





// Map Page as a StatefulWidget
class MapPage extends StatefulWidget {
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

// Date Page as a StatefulWidget
class DatePage extends StatefulWidget {
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

// Profile Page as a StatefulWidget
class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Profile Page", style: AppTypography.h2),
    );
  }
}