import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      child: Image.asset(
        isFavorite
            ? "assets/images/heart.png"
            : "assets/images/heart-filled.png",
        color: isFavorite ? Colors.grey : Colors.black,
        colorBlendMode: BlendMode.srcIn,
      ),
    );
  }
}
