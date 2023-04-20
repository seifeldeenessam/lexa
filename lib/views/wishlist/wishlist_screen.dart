import 'package:lexa/models/database.dart';
import 'package:lexa/utilities/sort_whislist_by_date.dart';
import 'package:lexa/views/widgets/empty_message.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<Map<String, dynamic>>> loadData() async {
      List<Map<String, dynamic>> items = [];

      final SQLite localStorage = SQLite();
      await localStorage.read("wishlist").then((value) => items = value);

      return items;
    }

    return FutureBuilder(
      future: loadData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const EmptyMessage(message: "Error getting transactions data", illustartion: "lists");
        } else {
          if (snapshot.data!.isEmpty) {
            return const EmptyMessage(message: "All wish list items will be here", illustartion: "lists");
          } else {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: sortWishlistByDate(context, snapshot.data),
            );
          }
        }
      },
    );
  }
}
