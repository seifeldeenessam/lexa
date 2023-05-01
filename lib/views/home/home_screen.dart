import 'package:flutter/material.dart';
import 'package:lexa/utilities/constants.dart';
import 'package:lexa/widgets/bottom_bar.dart';
import 'package:lexa/views/home/agreements_screen.dart';
import 'package:lexa/views/home/statistics_screen.dart';
import 'package:lexa/views/home/bookmarks_screen.dart';
import 'package:lexa/views/home/cards_screen.dart';
import 'package:lexa/views/home/transactions_screen.dart';
import 'package:lexa/widgets/top_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _active = 0;
  final List<Widget> _pages = [
    const CardsScreen(),
    const TransactionsScreen(),
    const StatisticsScreen(),
    const AgreementsScreen(),
    const BookmarksScreen(),
  ];

  void _navigate(int index) => setState(() => _active = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Units().spacing),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TopBarWidget(),
              SizedBox(height: Units().spacing),
              Expanded(child: _pages.elementAt(_active)),
              SizedBox(height: Units().spacing),
              BottomBarWidget(active: _active, navigate: _navigate),
            ],
          ),
        ),
      ),
    );
  }
}
