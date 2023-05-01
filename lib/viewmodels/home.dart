import 'package:flutter/material.dart';

@immutable
abstract class HomeViewModel {}

class Cards extends HomeViewModel {
  final Map<String, String> emptyMessage = {
    "illustration": "assets/svgs/illustrations/cards.svg",
    "message": "Your cards will be shown here",
  };
}

class Transactions extends HomeViewModel {
  final Map<String, String> emptyMessage = {
    "illustration": "assets/svgs/illustrations/transactions.svg",
    "message": "Your transactions will be shown here",
  };
}

class Statistics extends HomeViewModel {
  final Map<String, String> emptyMessage = {
    "illustration": "assets/svgs/illustrations/statistics.svg",
    "message": "Your statistics will be shown here",
  };
}

class Agreements extends HomeViewModel {
  final Map<String, String> emptyMessage = {
    "illustration": "assets/svgs/illustrations/agreements.svg",
    "message": "Your agreements will be shown here",
  };
}

class Bookmarks extends HomeViewModel {
  final Map<String, String> emptyMessage = {
    "illustration": "assets/svgs/illustrations/bookmarks.svg",
    "message": "Your bookmarks will be shown here",
  };
}
