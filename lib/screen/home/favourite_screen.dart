import 'package:doctor_appointment_app/util/custom_theme.dart';
import 'package:doctor_appointment_app/widget/doctor_card.dart';
import 'package:doctor_appointment_app/widget/hospital_card.dart';
import 'package:doctor_appointment_app/widget/remove_favorite_card.dart';
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
                 icon: const Icon(Icons.arrow_back, size: 24),
              ),
              const Spacer(),
              Center(child: Text('Favorites', style: AppTypography.h1)),
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
                        color:
                            selectedIndex == index ? Colors.black : Colors.grey,
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  RemoveFavoriteBottomSheet.show(
                    context,
                    name: "Dr. David Patel",
                    specialty: "Cardiologist",
                    location: "Cardiology Center, USA",
                    image: "assets/images/doctor_4.png", 
                    ratings: '4.9',
                    review:  "405 Reviews",
                    onRemove: () {
                      // Handle the removal logic here
                      // print("Removed from favorites");
                    },
                  );
                },
                child: selectedIndex == 0 ? DoctorsListCard() : HospitalList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
