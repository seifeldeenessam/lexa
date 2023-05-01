import 'package:flutter/material.dart';

@immutable
abstract class IntroductionViewModel {}

class Main extends IntroductionViewModel {
  final String background = 'assets/images/backgrounds/background.jpg';
  final String logo = "assets/svgs/branding/logo.svg";
  final String solgan = "The Only\nWallet\nYou Need.";
}
