import 'package:lexa/models/database.dart';
import 'package:lexa/models/bookmark.dart';
import 'package:lexa/utilities/constants.dart';
import 'package:lexa/utilities/app_texts.dart';
import 'package:lexa/utilities/show_snackbar.dart';
import 'package:lexa/widgets/app_bar.dart';
import 'package:lexa/widgets/button.dart';
import 'package:lexa/widgets/inputs/text.dart';
import 'package:lexa/widgets/inputs/switch.dart';
import 'package:flutter/material.dart';

class WishlistCreateScreen extends StatefulWidget {
  const WishlistCreateScreen({super.key});

  @override
  State<WishlistCreateScreen> createState() => _WishlistCreateScreenState();
}

class _WishlistCreateScreenState extends State<WishlistCreateScreen> {
  final Map<String, dynamic> _wishlistItemData = {
    "title": null,
    "price": null,
    "note": null,
    "link": null,
    "isImportant": 0,
    "isChecked": 0,
    "createdAt": DateTime.now(),
    "updatedAt": DateTime.now(),
  };

  void _titleChange(value) => setState(() => _wishlistItemData["title"] = value);
  void _priceChange(value) => setState(() => _wishlistItemData["price"] = num.parse(value));
  void _noteChange(value) => setState(() => _wishlistItemData["note"] = value);
  void _linkChange(value) => setState(() => _wishlistItemData["link"] = value);
  void _isImportantChange(value) => setState(() => _wishlistItemData["isImportant"] = value);

  void _submit(BuildContext context, Map<String, dynamic> data) async {
    final SQLite localStorage = SQLite();

    Map<String, Object?> item = Bookmark(
      title: data["title"],
      price: data["price"],
      note: data["note"],
      link: data["link"],
      isImportant: data["isImportant"],
      isChecked: data["isChecked"],
      createdAt: data["createdAt"],
      updatedAt: data["updatedAt"],
    ).toJSON();

    await localStorage.create('wishlist', item).then((value) => showSnackBar(context, true, "Wishlist item is successfully created"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(kToolbarHeight), child: AppBarWidget(title: AppTexts().wishlistCreateScreenTitle)),
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
                  TextInputWidget(label: "Title *", onChange: _titleChange),
                  SizedBox(height: Units().spacing / 2),
                  TextInputWidget(label: "Price", onChange: _priceChange, keyboardType: "number"),
                  SizedBox(height: Units().spacing / 2),
                  TextInputWidget(label: "Note", onChange: _noteChange, paragraph: true),
                  SizedBox(height: Units().spacing / 2),
                  TextInputWidget(label: "Link", onChange: _linkChange),
                  SizedBox(height: Units().spacing / 2),
                  SwitchInputWidget(label: "Mark as important", isEnabled: _wishlistItemData["isImportant"], onSwitch: _isImportantChange),
                ],
              ),
            ),
            SizedBox(height: Units().spacing),
            ButtonWidget(action: () => _submit(context, _wishlistItemData), label: "Create"),
          ],
        ),
      ),
    );
  }
}
