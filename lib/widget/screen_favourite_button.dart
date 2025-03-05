import 'package:doctor_appointment_app/widget/remove_favorite_card.dart';
import 'package:flutter/material.dart';

class ScreenFavouriteButton extends StatefulWidget {
  final bool isInitiallyFavorite;
  const ScreenFavouriteButton({super.key, this.isInitiallyFavorite = false});

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<ScreenFavouriteButton> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isInitiallyFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;
        });
        RemoveFavoriteBottomSheet.show(
          context,
          name: "Dr. David Patel",
          specialty: "Cardiologist",
          location: "Cardiology Center, USA",
          image: "assets/images/doctor_4.png",
          ratings: '4.9',
          review: "405 Reviews",
          onRemove: () {},
        );
      },
      child: Image.asset(
        isFavorite
            ? "assets/images/heart.png"
            : "assets/images/heart_filled.png",
        width: 15,
        height: 15,
      ),
    );
  }
}
