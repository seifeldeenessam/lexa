import 'package:flutter/material.dart';
import 'package:lexa/viewmodels/home.dart';
import 'package:lexa/widgets/empty_message.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EmptyMessage(illustartion: Bookmarks().emptyMessage["illustration"], message: Bookmarks().emptyMessage["message"]);
  }
}
