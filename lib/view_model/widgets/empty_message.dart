import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:lexa/view_model/theme/constants.dart';

class EmptyMessage extends StatelessWidget {
  final String illustartion;
  final String message;

  const EmptyMessage({Key? key, required this.illustartion, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/svgs/illustrations/$illustartion.svg', width: MediaQuery.of(context).size.width),
        SizedBox(height: Units().spacing),
        Text(message, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.tertiary)),
        SizedBox(height: MediaQuery.of(context).size.width * 0.4),
      ],
    );
  }
}
