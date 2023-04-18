import 'package:lexa/view_model/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class CardWidget extends StatelessWidget {
  final String image;

  const CardWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      speed: 300,
      flipOnTouch: true,
      direction: FlipDirection.VERTICAL,
      front: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(Units().borderRadius)),
        clipBehavior: Clip.hardEdge,
        child: Image.asset('assets/images/cards/front/$image', fit: BoxFit.fitWidth),
      ),
      back: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(Units().borderRadius)),
        clipBehavior: Clip.hardEdge,
        child: Image.asset('assets/images/cards/back/$image', fit: BoxFit.fitWidth),
      ),
    );
  }
}
