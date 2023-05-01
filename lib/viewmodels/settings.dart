import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

@immutable
abstract class SettingsViewModel {}

class Main extends SettingsViewModel {
  final BuildContext context;
  late final Map<String, List> settings;

  Main({required this.context}) {
    settings = {
      "Profile": [
        {'icon': PhosphorIcons.light.userList, 'title': 'Personal details'},
        {'icon': PhosphorIcons.light.bank, 'title': 'Manage accounts'},
        {'icon': PhosphorIcons.light.cloudArrowUp, 'title': 'Backup data'},
        {'icon': PhosphorIcons.light.fileCsv, 'title': 'CSV file'},
      ],
      "Security": [
        {'icon': PhosphorIcons.light.password, 'title': 'Wallet passcode'},
        {'icon': PhosphorIcons.light.lockKey, 'title': 'Lock wallet'},
        {'icon': PhosphorIcons.light.headset, 'title': 'Support'},
      ],
      "App": [
        {'icon': PhosphorIcons.light.palette, 'title': "Theme mode"},
        {'icon': PhosphorIcons.light.globe, 'title': 'Display language'},
      ],
      "About us": [
        {'icon': PhosphorIcons.light.shieldCheck, 'title': 'Privacy policies'},
        {'icon': PhosphorIcons.light.info, 'title': 'Terms & conditions'},
        {'icon': PhosphorIcons.light.star, 'title': 'Rate the app'},
      ]
    };
  }
}
