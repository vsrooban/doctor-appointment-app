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
      child: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        size: 16,
        color: isFavorite ? Colors.red : Colors.grey,
      ),
    );
  }
}

