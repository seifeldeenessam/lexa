import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final List<Widget>? actions;

  const AppBarWidget({Key? key, required this.title, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(PhosphorIcons.light.arrowLeft, color: Theme.of(context).colorScheme.primary, size: 24),
      ),
      title: Text(title),
      automaticallyImplyLeading: false,
      actions: actions,
    );
  }
}
