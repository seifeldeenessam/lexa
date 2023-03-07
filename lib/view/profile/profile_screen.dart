import 'package:lexa/view/profile/widgets/setting.dart';
import 'package:lexa/view/profile/widgets/user_details.dart';
import 'package:lexa/view_model/models/profile/profile_screen_view_model.dart';
import 'package:lexa/view_model/theme/constants.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const UserDetails(isPremium: true),
          const SizedBox(height: mainUnit),
          ...ProfileScreenViewModel().settings.map((e) => Setting(icon: e["icon"], title: e["title"])).toList(),
        ],
      ),
    );
  }
}
