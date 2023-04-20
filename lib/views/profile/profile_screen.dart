import 'package:lexa/widgets/setting.dart';
import 'package:lexa/widgets/user_details.dart';
import 'package:lexa/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List settings = [
      {'icon': PhosphorIcons.light.userList, 'title': 'Personal details'},
      {'icon': PhosphorIcons.light.password, 'title': 'Wallet passcode'},
      {'icon': PhosphorIcons.light.lockKey, 'title': 'Lock your wallet'},
      {'icon': PhosphorIcons.light.headset, 'title': 'Support'},
      {'icon': PhosphorIcons.light.shieldCheck, 'title': 'Privacy policies'},
      {'icon': PhosphorIcons.light.info, 'title': 'Terms & conditions'},
      {'icon': PhosphorIcons.light.star, 'title': 'Rate our app'},
      {'icon': PhosphorIcons.light.signOut, 'title': 'Sign out'},
    ];

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const UserDetails(isPremium: true),
          SizedBox(height: Units().spacing),
          ...settings.map((e) => Setting(icon: e["icon"], title: e["title"])).toList(),
        ],
      ),
    );
  }
}
