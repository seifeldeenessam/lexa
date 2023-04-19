import 'package:lexa/theme/constants.dart';
import 'package:lexa/utilities/show_modal.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String image;
  final String title;
  final double value;

  const CategoryWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModal(context, title, const ModalBody()),
      child: Padding(
        padding: EdgeInsets.all(Units().spacing / 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/categories/$image', width: 48, height: 48),
            SizedBox(width: Units().spacing / 2),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(child: Text(title, style: Theme.of(context).textTheme.titleMedium)),
                SizedBox(height: Units().spacing / 8),
                Text("$value E£", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).colorScheme.tertiary)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ModalBody extends StatelessWidget {
  const ModalBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [],
    );
  }
}
