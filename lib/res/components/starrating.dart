import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final double icnSize;
  final Color iconColor;
  final int ratingCount;

  const StarRating(
      {super.key,
      this.icnSize = 15.00,
      this.iconColor = Colors.blueAccent,
      required this.ratingCount});

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {

  @override
  Widget build(BuildContext context) {
    return Row(
     children: List.generate(widget.ratingCount, (index) {
        return Icon(
         Icons.star,
              color: widget.iconColor,
              size: widget.icnSize,
        );
      }),
    );
    
    

  }
}
