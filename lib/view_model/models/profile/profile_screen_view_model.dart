import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProfileScreenViewModel {
  List settings = [
    {'icon': PhosphorIcons.regular.userList, 'title': 'Personal details'},
    {'icon': PhosphorIcons.regular.password, 'title': 'Wallet passcode'},
    {'icon': PhosphorIcons.regular.lockKey, 'title': 'Lock your wallet'},
    {'icon': PhosphorIcons.regular.headset, 'title': 'Support'},
    {'icon': PhosphorIcons.regular.shieldCheck, 'title': 'Privacy policies'},
    {'icon': PhosphorIcons.regular.info, 'title': 'Terms & conditions'},
    {'icon': PhosphorIcons.regular.star, 'title': 'Rate our app'},
    {'icon': PhosphorIcons.regular.signOut, 'title': 'Sign out'},
  ];
}
