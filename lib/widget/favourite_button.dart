import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  final bool isInitiallyFavorite; 
  const FavoriteButton({super.key, this.isInitiallyFavorite = false}); 

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
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
      },
      child: Image.asset(
        isFavorite ? "assets/images/heart_filled.png" : "assets/images/heart.png",width: 15,height: 15,
      ),
    );
  }
}
