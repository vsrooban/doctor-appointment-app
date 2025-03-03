import 'package:doctor_appointment_app/util/custom_theme.dart';
// import 'package:doctor_appointment_app/widget/Doctor_card.dart';
import 'package:flutter/material.dart';

class DoctorDetailsCardWidget extends StatefulWidget {
  const DoctorDetailsCardWidget({super.key,required this.doctors,});

 final List<Map<String, String>> doctors;
  @override
  State<DoctorDetailsCardWidget> createState() => _DoctorDetailsCardWidgetState();
}

class _DoctorDetailsCardWidgetState extends State<DoctorDetailsCardWidget> {
   final List<Map<String, String>> doctors = [
    {
      "name": "Dr. David Patel",
      "specialty": "Cardiologist",
      "hospital": "Cardiology Center, USA",
      "image": "assets/images/doctor_4.png",
    },
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
      itemCount: widget.doctors.length,
      itemBuilder: (context, index) {
        final doctor = widget.doctors[index];
        return Card(
          elevation: 5,
          color: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: .9, vertical: 8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 95,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                    image: DecorationImage(
                      image: AssetImage(doctor['image']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Text(doctor['name']!, style: AppTypography.bodyLG),
                          
                        ],
                      ),
                      const Divider(thickness: .3, color: Colors.grey),
                      Text(doctor['specialty']!, style: AppTypography.bodySBold),
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined, size: 12),
                          Text(doctor['hospital']!, style: AppTypography.bodySRegular),
                        ],
                      ),
                  
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
        ),
      
    );
  }
}