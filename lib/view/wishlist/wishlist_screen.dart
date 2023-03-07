import 'package:lexa/view_model/functions/sort_whislist_by_date.dart';
import 'package:lexa/view_model/models/wishlist/whishlist_screen_view_model.dart';
import 'package:lexa/view_model/widgets/empty_message.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: WishlistScreenViewModel().loadData(),
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
