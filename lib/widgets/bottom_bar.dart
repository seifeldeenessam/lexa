import 'package:flutter/material.dart';
import 'package:lexa/utilities/constants.dart';
import 'package:lexa/widgets/button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class BottomBarWidget extends StatelessWidget {
  final int active;
  final Function(int) navigate;

  const BottomBarWidget({super.key, required this.active, required this.navigate});

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = [
      ButtonWidget(
        action: () => active == 0 ? Navigator.pushNamed(context, '/cards/create') : navigate(0),
        icon: active == 0 ? PhosphorIcons.fill.plusCircle : PhosphorIcons.light.creditCard,
        iconColor: active == 0 ? Theme.of(context).colorScheme.primary : GlobalColors().grey,
        type: ButtonTypes.secondary,
      ),
      ButtonWidget(
        action: () => active == 1 ? Navigator.pushNamed(context, '/transactions/create') : navigate(1),
        icon: active == 1 ? PhosphorIcons.fill.plusCircle : PhosphorIcons.light.money,
        iconColor: active == 1 ? Theme.of(context).colorScheme.primary : GlobalColors().grey,
        type: ButtonTypes.secondary,
      ),
      ButtonWidget(
        action: () => navigate(2),
        icon: active == 2 ? PhosphorIcons.fill.chartPie : PhosphorIcons.light.chartPie,
        iconColor: active == 2 ? Theme.of(context).colorScheme.primary : GlobalColors().grey,
        type: ButtonTypes.secondary,
      ),
      ButtonWidget(
        action: () => active == 3 ? Navigator.pushNamed(context, '/agreements/create') : navigate(3),
        icon: active == 3 ? PhosphorIcons.fill.plusCircle : PhosphorIcons.light.handshake,
        iconColor: active == 3 ? Theme.of(context).colorScheme.primary : GlobalColors().grey,
        type: ButtonTypes.secondary,
      ),
      ButtonWidget(
        action: () => active == 4 ? Navigator.pushNamed(context, '/bookmarks/create') : navigate(4),
        icon: active == 4 ? PhosphorIcons.fill.plusCircle : PhosphorIcons.light.bookmarks,
        iconColor: active == 4 ? Theme.of(context).colorScheme.primary : GlobalColors().grey,
        type: ButtonTypes.secondary,
      ),
    ];

    return Container(
      padding: EdgeInsets.all(Units().spacing / 2),
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.onBackground, borderRadius: BorderRadius.circular(Units().borderRadius)),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: buttons.length,
        crossAxisSpacing: Units().spacing,
        children: buttons.map((button) => button).toList(),
      ),
    );
  }
}
