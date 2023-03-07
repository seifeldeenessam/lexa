import 'package:flutter/material.dart';
import 'package:lexa/view/agreements/agreements_create_screen.dart';
import 'package:lexa/view/authentication/accounts_fill_screen.dart';
import 'package:lexa/view/authentication/passcode_creation_screen.dart';
import 'package:lexa/view/authentication/passcode_entry_screen.dart';
import 'package:lexa/view/authentication/personal_info_screen.dart';
import 'package:lexa/view/authentication/phone_verification_screen.dart';
import 'package:lexa/view/cards/cards_create_screen.dart';
import 'package:lexa/view/authentication/phone_entry_screen.dart';
import 'package:lexa/view/introduction/introduction_screen.dart';
import 'package:lexa/view/navigation/navigation_handler.dart';
import 'package:lexa/view/transactions/transactions_create_screen.dart';
import 'package:lexa/view/transfers/transfers_create_screen.dart';
import 'package:lexa/view/wishlist/wishlist_create_screen.dart';

Map<String, WidgetBuilder> get routesHandler {
  return {
    '/': (context) => const IntroductionScreen(),
    '/phone-entry': (context) => const PhoneEntryScreen(),
    '/phone-verification': (context) => const PhoneVerificationScreen(),
    '/personal-info': (context) => const PersonalInfoEntryScreen(),
    '/passcode-creation': (context) => const PasscodeCreationScreen(),
    '/accounts-values': (context) => const AccountsFillScreen(),
    '/passcode-entry': (context) => const PasscodeEntryScreen(),
    '/navigator': (context) => const NavigationHandler(),
    '/card/create': (context) => const CardsCreateScreen(),
    '/transaction/create': (context) => const TransactionsCreateScreen(),
    '/transfer/create': (context) => const TransfersCreateScreen(),
    '/agreement/create': (context) => const AgreementsCreateScreen(),
    '/wishlist/create': (context) => const WishlistCreateScreen(),
  };
}
