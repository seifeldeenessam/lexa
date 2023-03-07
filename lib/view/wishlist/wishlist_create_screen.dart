import 'package:lexa/view_model/models/wishlist/whishlist_create_screen_view_model.dart';
import 'package:lexa/view_model/theme/constants.dart';
import 'package:lexa/view_model/widgets/app_bar.dart';
import 'package:lexa/view_model/widgets/button.dart';
import 'package:lexa/view_model/widgets/inputs/text.dart';
import 'package:lexa/view_model/widgets/inputs/switch.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(kToolbarHeight), child: AppBarWidget(title: WishlistCreateScreenViewModel().title)),
      body: Padding(
        padding: const EdgeInsets.all(mainUnit),
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
                  const SizedBox(height: mainUnit / 2),
                  TextInputWidget(label: "Price", onChange: _priceChange, keyboardType: "number"),
                  const SizedBox(height: mainUnit / 2),
                  TextInputWidget(label: "Note", onChange: _noteChange, paragraph: true),
                  const SizedBox(height: mainUnit / 2),
                  TextInputWidget(label: "Link", onChange: _linkChange),
                  const SizedBox(height: mainUnit / 2),
                  SwitchInputWidget(label: "Mark as important", isEnabled: _wishlistItemData["isImportant"], onSwitch: _isImportantChange),
                ],
              ),
            ),
            const SizedBox(height: mainUnit),
            ButtonWidget(action: () => WishlistCreateScreenViewModel().submit(context, _wishlistItemData), label: "Create"),
          ],
        ),
      ),
    );
  }
}
