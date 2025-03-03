import 'package:doctor_appointment_app/util/custom_theme.dart';
// import 'package:doctor_appointment_app/widget/Doctor_card.dart';
import 'package:doctor_appointment_app/widget/favourite_button.dart';
import 'package:flutter/material.dart';

class DoctorDetailsScreen extends StatefulWidget {
  const DoctorDetailsScreen({super.key});

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
                Text('Doctor Details',style: AppTypography.h1,),
                SizedBox(child: FavoriteButton(),height: 20,width: 20,),

              ],
            ),
            SizedBox(height: 15,),
            
          ],
        ),
      ),
    );
  }
}