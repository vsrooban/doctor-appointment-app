import 'package:doctor_appointment_app/util/custom_theme.dart';
import 'package:doctor_appointment_app/widget/favourite_button.dart';
import 'package:flutter/material.dart';

class RemoveFavoriteBottomSheet {
  static void show(
    BuildContext context, {
    required String name,
    required String specialty,
    required String location,
    required String image,
    required String ratings,
    required String review,
    required VoidCallback onRemove,
  }) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Remove from Favorites?',
                style: AppTypography.bodyLG,
              ),
              Divider(
                thickness: .5,
                color: Colors.grey,
              ),
              SizedBox(height: 16),
              Card(
                elevation: 5,
                color: Colors.white,
                margin:
                    const EdgeInsets.symmetric(horizontal: 9, vertical: 8.0),
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
                            image: AssetImage(image),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(name, style: AppTypography.bodyLG),
                                FavoriteButton(),
                              ],
                            ),
                            const Divider(thickness: 0.3, color: Colors.grey),
                            Text(specialty, style: AppTypography.bodySBold),
                            Row(
                              children: [
                                const Icon(Icons.location_on_outlined,
                                    size: 12),
                                Text(location,
                                    style: AppTypography.bodySRegular),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.amber, size: 14),
                                Text(' $ratings | $review',
                                    style: AppTypography.bodyXSRegular),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                      ),
                      child: Text("Cancel",
                          style: AppTypography.bodyLG
                              .copyWith(color: Colors.black)),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      child: Text("Yes, Remove",
                          style: AppTypography.bodyLG
                              .copyWith(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
