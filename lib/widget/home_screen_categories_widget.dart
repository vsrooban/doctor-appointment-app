import 'package:doctor_appointment_app/util/custom_theme.dart';
import 'package:flutter/material.dart';

class HomeScreenCategoriesWidget extends StatelessWidget {
  const HomeScreenCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 226,
      width: 390,
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 10),
          _buildCategoryRow([
            CategoryItem(label: 'Dentistry', imagePath: 'assets/images/dentist_symbol.png', bgColor: Color(0xFFDC9497)),
            CategoryItem(label: 'Cardiology', imagePath: 'assets/images/heart_symbol.png', bgColor: Color(0xFF93C19E)),
            CategoryItem(label: 'Pulmonology', imagePath: 'assets/images/lungs_symbol.png', bgColor: Color(0xFFF5AD7E)),
            CategoryItem(label: 'General', imagePath: 'assets/images/stethoscopes_symbol.png', bgColor: Color(0xFFACA1CD)),
          ]),
          const SizedBox(height: 20),
          _buildCategoryRow([
            CategoryItem(label: 'Neurology', imagePath: 'assets/images/brain_symbol.png', bgColor: Color(0xFF4D9B91)),
            CategoryItem(label: 'Gastro', imagePath: 'assets/images/stomach_symbol.png', bgColor: Color(0xFF352261)),
            CategoryItem(label: 'Laboratory', imagePath: 'assets/images/lab_symbol.png', bgColor: Color(0xFFDEB6B5)),
            CategoryItem(label: 'Vaccination', imagePath: 'assets/images/injection_symbol.png', bgColor: Color(0xFF89CCDB)),
          ]),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Categories', style: AppTypography.h3),
        Text('See All', style: AppTypography.bodySMedium.copyWith(color: Colors.grey)),
      ],
    );
  }

  Widget _buildCategoryRow(List<CategoryItem> categories) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: categories,
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String label;
  final String imagePath;
  final Color bgColor;

  const CategoryItem({
    required this.label,
    required this.imagePath,
    required this.bgColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.asset(imagePath),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            color: Color(0xFF4B5563),
          ),
        )
      ],
    );
  }
}
