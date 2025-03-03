import 'package:doctor_appointment_app/screen/home/doctor_details_screen.dart';
import 'package:doctor_appointment_app/screen/home/home_screen.dart';
import 'package:doctor_appointment_app/util/custom_theme.dart';
import 'package:doctor_appointment_app/widget/doctor_card.dart';
import 'package:flutter/material.dart';

class AllDoctorsPage extends StatefulWidget {
  const AllDoctorsPage({super.key});

  @override
  State<AllDoctorsPage> createState() => _AllDoctorsPageState();
}

class _AllDoctorsPageState extends State<AllDoctorsPage> {
  final List<String> categories = [
    "All",
    "General",
    "Cardiologist",
    "Dentist",
    "Neurologist"
  ];
  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));},
                    icon: const Icon(Icons.arrow_back, size: 24),
                  ),
                  const Spacer(),
                  Text('All Doctors', style: AppTypography.h1),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                cursorColor: Colors.grey,
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  hintText: 'Search doctor...',
                  hintStyle: AppTypography.bodySRegular,
                  filled: true,
                  fillColor: Color(0xfff7f9fa),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white,width: 0.1),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: ChoiceChip(
                        showCheckmark: false,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        label: Text(categories[index], style: AppTypography.bodySBold),
                        selected: selectedCategoryIndex == index,
                        onSelected: (selected) {
                          setState(() {
                            selectedCategoryIndex = index;
                          });
                        },
                        selectedColor: Colors.black,
                        backgroundColor: Colors.grey[200],
                        labelStyle: TextStyle(
                          color: selectedCategoryIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('532 founds', style: AppTypography.bodySBold),
                  Row(
                    children: [
                      Text('Default', style: AppTypography.bodySMedium.copyWith(color: Colors.grey)),
                      const SizedBox(width: 4),
                      const Icon(Icons.import_export, size: 18,color: Colors.grey,),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 15),
              Expanded(
                child: InkWell(onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DoctorDetailsScreen()));
                },child: DoctorsListCard()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

