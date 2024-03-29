import 'package:flutter/material.dart';
import 'app_text.dart';

class CustomRating extends StatelessWidget{
  final double ratingScore;
  final bool showReview;

  const CustomRating({
    Key? key,
    required this.ratingScore,
    this.showReview = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        for ( int i = 1; i<=5; i++)
        Icon(
          i <= ratingScore ? Icons.star : (i-1 < ratingScore ? Icons.star_half : Icons.star_border),
          color: i <= ratingScore ? Color.fromARGB(255, 219, 207, 41) : Colors.grey,
          size: 15.0,
        ),
        const SizedBox(width: 10),
        AppText.medium('$ratingScore'),
      ],
    );
  }
}