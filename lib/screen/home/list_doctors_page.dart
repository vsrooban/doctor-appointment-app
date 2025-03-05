import 'package:doctor_appointment_app/screen/home/home_screen.dart';
import 'package:doctor_appointment_app/util/custom_theme.dart';
import 'package:doctor_appointment_app/widget/card_doctor.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  icon: const Icon(Icons.arrow_back, size: 24),
                ),
                const Spacer(),
                Text('All Doctors', style: AppTypography.h1),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: SearchBar(
                textStyle: WidgetStateProperty.all(
                    AppTypography.bodySRegular.copyWith(color: Colors.grey)),
                side: const WidgetStatePropertyAll(BorderSide(
                    color: Color.fromARGB(255, 199, 197, 197), width: 0.01)),
                hintText: 'Search doctor...',
                hintStyle: WidgetStateProperty.all(
                    AppTypography.bodySRegular.copyWith(color: Colors.grey)),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side:
                        const BorderSide(style: BorderStyle.solid, width: 0.1),
                  ),
                ),
                backgroundColor:
                    WidgetStateProperty.all(const Color(0xFFF3F4F6)),
                shadowColor: WidgetStateProperty.all(Colors.transparent),
                leading: Icon(Icons.search, color: Colors.grey),
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
                      label: Text(categories[index],
                          style: AppTypography.bodySBold),
                      selected: selectedCategoryIndex == index,
                      onSelected: (selected) {
                        setState(() {
                          selectedCategoryIndex = index;
                        });
                      },
                      selectedColor: const Color(0xFF1C2A3A),
                      backgroundColor: Colors.white,
                      labelStyle: TextStyle(
                        color: selectedCategoryIndex == index
                            ? Colors.white
                            : const Color(0xFF1C2A3A),
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
                    Text('Default',
                        style: AppTypography.bodySBold
                            .copyWith(color: Colors.grey)),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.import_export,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ],
                )
              ],
            ),
            Expanded(
              child: DoctorsListCard(),
            ),
          ],
        ),
      ),
    );
  }
}
