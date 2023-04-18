import 'package:lexa/view/balance/balance_screen.dart';
import 'package:lexa/view/cards/cards_screen.dart';
import 'package:lexa/view/agreements/agreements_screen.dart';
import 'package:lexa/view/transactions/transactions_screen.dart';
import 'package:lexa/view/profile/profile_screen.dart';
import 'package:lexa/view/wishlist/wishlist_screen.dart';
import 'package:lexa/view_model/theme/constants.dart';
import 'package:lexa/view_model/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NavigationHandler extends StatefulWidget {
  const NavigationHandler({super.key});

  @override
  State<NavigationHandler> createState() => _NavigationHandlerState();
}

class _NavigationHandlerState extends State<NavigationHandler> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const CardsScreen(),
    const TransactionsScreen(),
    const AgreementsScreen(),
    const WishlistScreen(),
    const BalanceScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) => setState(() => _selectedIndex = index);

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
              Expanded(child: _pages.elementAt(_selectedIndex)),
              SizedBox(height: Units().spacing),
              Container(
                padding: EdgeInsets.all(Units().spacing / 2),
                decoration: BoxDecoration(color: Theme.of(context).colorScheme.onBackground, borderRadius: BorderRadius.circular(Units().borderRadius)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ButtonWidget(
                        action: () => _selectedIndex == 0 ? Navigator.pushNamed(context, '/card/create') : _onItemTapped(0),
                        icon: _selectedIndex == 0 ? PhosphorIcons.plusCircleFill : PhosphorIcons.creditCard,
                        iconColor: _selectedIndex == 0 ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.tertiary,
                        type: ButtonTypes.secondary,
                      ),
                    ),
                    Expanded(
                      child: ButtonWidget(
                        action: () => _selectedIndex == 1 ? Navigator.pushNamed(context, '/transaction/create') : _onItemTapped(1),
                        icon: _selectedIndex == 1 ? PhosphorIcons.plusCircleFill : PhosphorIcons.money,
                        iconColor: _selectedIndex == 1 ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.tertiary,
                        type: ButtonTypes.secondary,
                      ),
                    ),
                    Expanded(
                      child: ButtonWidget(
                        action: () => _selectedIndex == 2 ? Navigator.pushNamed(context, '/agreement/create') : _onItemTapped(2),
                        icon: _selectedIndex == 2 ? PhosphorIcons.plusCircleFill : PhosphorIcons.handshake,
                        iconColor: _selectedIndex == 2 ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.tertiary,
                        type: ButtonTypes.secondary,
                      ),
                    ),
                    Expanded(
                      child: ButtonWidget(
                        action: () => _selectedIndex == 3 ? Navigator.pushNamed(context, '/wishlist/create') : _onItemTapped(3),
                        icon: _selectedIndex == 3 ? PhosphorIcons.plusCircleFill : PhosphorIcons.listChecks,
                        iconColor: _selectedIndex == 3 ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.tertiary,
                        type: ButtonTypes.secondary,
                      ),
                    ),
                    Expanded(
                      child: ButtonWidget(
                        action: () => _onItemTapped(4),
                        icon: PhosphorIcons.chartLine,
                        iconColor: _selectedIndex == 4 ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.tertiary,
                        type: ButtonTypes.secondary,
                      ),
                    ),
                    Expanded(
                      child: ButtonWidget(
                        action: () => _onItemTapped(5),
                        icon: PhosphorIcons.user,
                        iconColor: _selectedIndex == 5 ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.tertiary,
                        type: ButtonTypes.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
