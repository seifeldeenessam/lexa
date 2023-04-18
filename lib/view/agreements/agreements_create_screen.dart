import 'package:lexa/view_model/models/agreements/agreements_create_screen_view_model.dart';
import 'package:lexa/view_model/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:lexa/view_model/widgets/app_bar.dart';

class AgreementsCreateScreen extends StatefulWidget {
  const AgreementsCreateScreen({super.key});

  @override
  State<AgreementsCreateScreen> createState() => _AgreementsCreateScreenState();
}

class _AgreementsCreateScreenState extends State<AgreementsCreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(kToolbarHeight), child: AppBarWidget(title: AgreementsCreateScreenViewModel().title)),
      body: Padding(
        padding: EdgeInsets.all(Units().spacing),
        child: Column(
          children: const [],
        ),
      ),
    );
  }
}
