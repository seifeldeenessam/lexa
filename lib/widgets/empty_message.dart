import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:lexa/utilities/constants.dart';

class EmptyMessage extends StatelessWidget {
  final String? illustartion;
  final String? message;

  const EmptyMessage({Key? key, required this.illustartion, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(illustartion!, width: MediaQuery.of(context).size.width * 0.8),
        SizedBox(height: Units().spacing),
        FittedBox(child: Text(message!, style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: GlobalColors().grey))),
      ],
    );
  }
}
