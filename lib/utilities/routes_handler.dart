import 'package:flutter/material.dart';
import 'package:lexa/views/introduction_screen.dart';
import 'package:lexa/views/authentication/signin_screen.dart';
import 'package:lexa/views/authentication/signup_screen.dart';
import 'package:lexa/views/authentication/phone_verify_screen.dart';
import 'package:lexa/views/authentication/personal_info_screen.dart';
import 'package:lexa/views/authentication/passcode_creation_screen.dart';
import 'package:lexa/views/authentication/accounts_fill_screen.dart';
import 'package:lexa/views/home/home_screen.dart';
import 'package:lexa/views/settings/settings_screen.dart';

Map<String, WidgetBuilder> get routesHandler {
  return {
    '/introduction': (context) => const IntroductionScreen(),
    '/auth': (context) => const SignInScreen(),
    '/auth/phone-number/enter': (context) => const SignUpScreen(),
    '/auth/phone-number/verify': (context) => const PhoneVerifyScreen(),
    '/auth/personal-info': (context) => const PersonalInfoEntryScreen(),
    '/auth/passcode/create': (context) => const PasscodeCreationScreen(),
    '/auth/accounts-values': (context) => const AccountsFillScreen(),
    '/': (context) => const HomeScreen(),
    '/settings': (context) => const SettingsScreen(),
  };
}
