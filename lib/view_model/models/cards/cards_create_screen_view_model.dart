import 'package:lexa/view_model/utilities/app_texts.dart';

class CardsCreateScreenViewModel {
  String title = AppTexts().cardsCreateScreenTitle;
  final List<String> cardTypes = ["Identity card", "Bank card", "Shopping card", "Other"];

  void submit(Map<String, dynamic> cardData) async {}
}
