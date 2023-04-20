import 'package:lexa/models/database.dart';
import 'package:lexa/utilities/constants.dart';
import 'package:lexa/views/widgets/button.dart';
import 'package:lexa/views/widgets/empty_message.dart';
import 'package:flutter/material.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  final SQLite _localStorage = SQLite();
  List<Map<String, dynamic>> cards = [];

  void _loadData() async {
    final data = await _localStorage.read("accounts");
    setState(() => cards = data);
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return const EmptyMessage(message: "All cards will be here", illustartion: "cards");
  }
}

class CardMutationModal extends StatelessWidget {
  final bool isFavorite;

  const CardMutationModal({this.isFavorite = true, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonWidget(action: () {}, label: isFavorite ? "Remove from favorites" : "Add to favorites", backgroundColor: Theme.of(context).colorScheme.onBackground),
        SizedBox(height: Units().spacing / 2),
        ButtonWidget(action: () {}, label: "Edit card", backgroundColor: Theme.of(context).colorScheme.onBackground),
        SizedBox(height: Units().spacing / 2),
        ButtonWidget(action: () {}, label: "Delete Card", labelColor: Theme.of(context).colorScheme.onBackground, backgroundColor: GlobalColors().error)
      ],
    );
  }
}

// return ListView.separated(
//   shrinkWrap: true,
//   physics: const BouncingScrollPhysics(),
//   itemCount: cards.length,
//   itemBuilder: (context, index) {
//     return GestureDetector(
//       onLongPress: () => showModal(context, cards[index].title, CardMutationModal(isFavorite: cards[index].isFavorite)),
//       child: CardWidget(image: cards[index].image),
//     );
//   },
//   separatorBuilder: (context, index) => SizedBox(height: Units().spacing / 2),
// );

// CircularProgressIndicator(color: colorBlackPrimary, strokeWidth: 2.0),