import 'package:lexa/utilities/constants.dart';
import 'package:lexa/utilities/app_texts.dart';
import 'package:lexa/widgets/app_bar.dart';
import 'package:lexa/widgets/button.dart';
import 'package:lexa/widgets/inputs/dropdown.dart';
import 'package:lexa/widgets/inputs/image.dart';
import 'package:lexa/widgets/inputs/nfc.dart';
import 'package:lexa/widgets/inputs/text.dart';
import 'package:flutter/material.dart';

class CardsCreateScreen extends StatefulWidget {
  const CardsCreateScreen({super.key});

  @override
  State<CardsCreateScreen> createState() => _CardsCreateScreenState();
}

class _CardsCreateScreenState extends State<CardsCreateScreen> {
  late Map<String, dynamic> _cardData;
  final List<String> _cardTypes = ["Identity card", "Bank card", "Shopping card", "Other"];

  void _frontImageChange(value) => setState(() => _cardData["frontImage"] = value);
  void _backImageChange(value) => setState(() => _cardData["backImage"] = value);
  void _typeChange(value) => setState(() => _cardData["type"] = value);
  void _titleChange(value) => setState(() => _cardData["title"] = value);

  void _submit(Map<String, dynamic> cardData) async {}

  @override
  void initState() {
    super.initState();
    _cardData = {
      "frontImage": null,
      "backImage": null,
      "type": _cardTypes[0],
      "title": null,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(kToolbarHeight), child: AppBarWidget(title: AppTexts().cardsCreateScreenTitle)),
      body: Padding(
        padding: EdgeInsets.all(Units().spacing),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  ImageInputWidget(label: "Card front *", onChange: _frontImageChange),
                  SizedBox(height: Units().spacing / 2),
                  ImageInputWidget(label: "Card back *", onChange: _backImageChange),
                  SizedBox(height: Units().spacing / 2),
                  DropdownInputWidget(label: "Card type", items: _cardTypes, onChange: _typeChange),
                  SizedBox(height: Units().spacing / 2),
                  TextInputWidget(label: "Card title *", onChange: _titleChange),
                  SizedBox(height: Units().spacing / 2),
                  if (_cardData["type"] == "Bank card" || _cardData["type"] == "Other") NFCInputWidget(label: "Scan card data", onChange: () {}),
                ],
              ),
            ),
            SizedBox(height: Units().spacing),
            ButtonWidget(action: () => _submit(_cardData), label: "Create"),
          ],
        ),
      ),
    );
  }
}
