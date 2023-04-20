import 'package:lexa/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:lexa/utilities/app_texts.dart';
import 'package:lexa/widgets/app_bar.dart';

class AgreementsCreateScreen extends StatefulWidget {
  const AgreementsCreateScreen({super.key});

  @override
  State<AgreementsCreateScreen> createState() => _AgreementsCreateScreenState();
}

class _AgreementsCreateScreenState extends State<AgreementsCreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(kToolbarHeight), child: AppBarWidget(title: AppTexts().agreementsCreateScreenTitle)),
      body: Padding(
        padding: EdgeInsets.all(Units().spacing),
        child: Column(
          children: const [],
        ),
      ),
    );
  }
}
