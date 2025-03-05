import 'package:doctor_appointment_app/util/custom_theme.dart';
import 'package:doctor_appointment_app/widget/favorite_screen_doctor_card.dart';
import 'package:doctor_appointment_app/widget/hospital_card.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  int selectedIndex = 0;

  final List<String> sections = ["Doctors", "Hospitals"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, size: 24),
              ),
              const Spacer(),
              Center(child: Text('Favorites', style: AppTypography.h1)),
              const Spacer(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(sections.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Column(
                  children: [
                    Text(
                      sections[index],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: selectedIndex == index
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color:
                            selectedIndex == index ? Colors.black : Colors.grey,
                      ),
                    ),
                    if (selectedIndex == index)
                      Container(
                        height: 3,
                        width: 80,
                        color: Color(0xff1C2A3A),
                      ),
                  ],
                ),
              );
            }),
          ),
          Container(
            height: 1,
            color: Color(0xFFE5E7EB),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: selectedIndex == 0
                  ? FavoriteScreenDoctorCard()
                  : HospitalList(),
            ),
          ),
        ],
      ),
    );
  }
}
