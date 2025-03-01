import 'package:doctor_appointment_app/util/custom_theme.dart';
import 'package:flutter/material.dart';

class HomeScreenCategoriesWidget extends StatefulWidget {
  const HomeScreenCategoriesWidget({super.key});

  @override
  State<HomeScreenCategoriesWidget> createState() =>
      _HomeScreenCategoriesWidgetState();
}

class _HomeScreenCategoriesWidgetState
    extends State<HomeScreenCategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.symmetric(horizontal: 25),
      height: 218,
      width: 390,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: AppTypography.h3,
              ),
              Text(
                'See All',
                style: AppTypography.bodySMedium.copyWith(color: Colors.grey),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 62,
                    width: 62,
                    decoration: BoxDecoration(
                        color: Color(0xFFDC9497),
                        borderRadius: BorderRadius.circular(8)),
                    child: Image.asset('assets/images/dentist_symbol.png'),
                  ),
                  Text(
                    'Dentistry',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF4B5563)),
                  )
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 62,
                    width: 62,
                    decoration: BoxDecoration(
                        color: Color(0xFFDC9497),
                        borderRadius: BorderRadius.circular(8)),
                    child: Image.asset('assets/images/dentist_symbol.png'),
                  ),
                  Text(
                    'Dentistry',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF4B5563)),
                  )
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 62,
                    width: 62,
                    decoration: BoxDecoration(
                        color: Color(0xFFDC9497),
                        borderRadius: BorderRadius.circular(8)),
                    child: Image.asset('assets/images/dentist_symbol.png'),
                  ),
                  Text(
                    'Dentistry',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF4B5563)),
                  )
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 62,
                    width: 62,
                    decoration: BoxDecoration(
                        color: Color(0xFFDC9497),
                        borderRadius: BorderRadius.circular(8)),
                    child: Image.asset('assets/images/dentist_symbol.png'),
                  ),
                  Text(
                    'Dentistry',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF4B5563)),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 62,
                    width: 62,
                    decoration: BoxDecoration(
                        color: Color(0xFFDC9497),
                        borderRadius: BorderRadius.circular(8)),
                    child: Image.asset('assets/images/dentist_symbol.png'),
                  ),
                  Text(
                    'Dentistry',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF4B5563)),
                  )
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 62,
                    width: 62,
                    decoration: BoxDecoration(
                        color: Color(0xFFDC9497),
                        borderRadius: BorderRadius.circular(8)),
                    child: Image.asset('assets/images/dentist_symbol.png'),
                  ),
                  Text(
                    'Dentistry',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF4B5563)),
                  )
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 62,
                    width: 62,
                    decoration: BoxDecoration(
                        color: Color(0xFFDC9497),
                        borderRadius: BorderRadius.circular(8)),
                    child: Image.asset('assets/images/dentist_symbol.png'),
                  ),
                  Text(
                    'Dentistry',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF4B5563)),
                  )
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 62,
                    width: 62,
                    decoration: BoxDecoration(
                        color: Color(0xFFDC9497),
                        borderRadius: BorderRadius.circular(8)),
                    child: Image.asset('assets/images/dentist_symbol.png'),
                  ),
                  Text(
                    'Dentistry',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF4B5563)),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
