import 'package:doctor_appointment_app/util/custom_theme.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {  },
            icon: Icon(Icons.arrow_back),
            ),
            Spacer(),
            Text('Favorites',
            style: AppTypography.bodyLG,
            ),
          ], 
        ),
      ],
    );
  }
}