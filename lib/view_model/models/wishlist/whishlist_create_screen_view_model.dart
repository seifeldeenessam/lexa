import 'package:flutter/material.dart';
import 'package:lexa/model/database/local_database.dart';
import 'package:lexa/model/models/wishlist_item.dart';
import 'package:lexa/view_model/functions/show_snackbar.dart';
import 'package:lexa/view_model/utilities/app_texts.dart';

class WishlistCreateScreenViewModel {
  String title = AppTexts().wishlistCreateScreenTitle;

  void submit(BuildContext context, Map<String, dynamic> data) async {
    final LocalDatabase localStorage = LocalDatabase();

    Map<String, Object?> item = WishlistItem(
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
}
