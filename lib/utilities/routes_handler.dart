import 'package:flutter/material.dart';
import 'package:lexa/views/agreements/agreements_create_screen.dart';
import 'package:lexa/views/authentication/accounts_fill_screen.dart';
import 'package:lexa/views/authentication/passcode_creation_screen.dart';
import 'package:lexa/views/authentication/personal_info_screen.dart';
import 'package:lexa/views/authentication/phone_verification_screen.dart';
import 'package:lexa/views/cards/cards_create_screen.dart';
import 'package:lexa/views/authentication/phone_entry_screen.dart';
import 'package:lexa/views/introduction/introduction_screen.dart';
import 'package:lexa/views/navigation/navigation_handler.dart';
import 'package:lexa/views/transactions/transactions_create_screen.dart';
import 'package:lexa/views/transfers/transfers_create_screen.dart';
import 'package:lexa/views/wishlist/wishlist_create_screen.dart';

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
