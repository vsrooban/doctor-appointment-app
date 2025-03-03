import 'package:doctor_appointment_app/util/custom_theme.dart';
import 'package:doctor_appointment_app/widget/doctor_card.dart';
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
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
              const Spacer(),
              Text('Favorites', style: AppTypography.bodyLG),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 15),
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
                        color: selectedIndex == index ? Colors.black : Colors.grey,
                      ),
                    ),
                    if (selectedIndex == index)
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        height: 3,
                        width: 50,
                        color: Colors.black,
                      ),
                  ],
                ),
              );
            }),
          ),
          const Divider(thickness: 0.5, color: Colors.grey),
          const SizedBox(height: 20),
          Expanded(
            child: selectedIndex == 0
                ? DoctorsListCard()
                : HospitalList(),
          ),
        ],
      ),
    );
  }
}


