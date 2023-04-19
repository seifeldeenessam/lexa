import 'package:flutter/material.dart';
import 'package:lexa/screens/agreements/agreements_create_screen.dart';
import 'package:lexa/screens/authentication/accounts_fill_screen.dart';
import 'package:lexa/screens/authentication/passcode_creation_screen.dart';
import 'package:lexa/screens/authentication/personal_info_screen.dart';
import 'package:lexa/screens/authentication/phone_verification_screen.dart';
import 'package:lexa/screens/cards/cards_create_screen.dart';
import 'package:lexa/screens/authentication/phone_entry_screen.dart';
import 'package:lexa/screens/introduction/introduction_screen.dart';
import 'package:lexa/screens/navigation/navigation_handler.dart';
import 'package:lexa/screens/transactions/transactions_create_screen.dart';
import 'package:lexa/screens/transfers/transfers_create_screen.dart';
import 'package:lexa/screens/wishlist/wishlist_create_screen.dart';

Map<String, WidgetBuilder> get routesHandler {
  return {
    '/': (context) => const IntroductionScreen(),
    '/phone-entry': (context) => const PhoneEntryScreen(),
    '/phone-verification': (context) => const PhoneVerificationScreen(),
    '/personal-info': (context) => const PersonalInfoEntryScreen(),
    '/passcode-creation': (context) => const PasscodeCreationScreen(),
    '/accounts-values': (context) => const AccountsFillScreen(),
    '/navigator': (context) => const NavigationHandler(),
    '/card/create': (context) => const CardsCreateScreen(),
    '/transaction/create': (context) => const TransactionsCreateScreen(),
    '/transfer/create': (context) => const TransfersCreateScreen(),
    '/agreement/create': (context) => const AgreementsCreateScreen(),
    '/wishlist/create': (context) => const WishlistCreateScreen(),
  };
}
