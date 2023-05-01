import 'package:lexa/viewmodels/settings.dart';
import 'package:lexa/widgets/app_bar.dart';
import 'package:lexa/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:lexa/widgets/button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> renderSettings() {
      return Main(context: context).settings.entries.map((setting) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(setting.key, style: Theme.of(context).textTheme.labelMedium),
            SizedBox(height: Units().spacing / 2),
            Container(
              padding: EdgeInsets.all(Units().spacing / 2),
              margin: EdgeInsets.only(bottom: Units().spacing),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onBackground,
                borderRadius: BorderRadius.circular(Units().spacing / 2),
              ),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: setting.value.length,
                itemBuilder: (context, index) => Setting(icon: setting.value[index]["icon"], title: setting.value[index]["title"]),
                separatorBuilder: (context, index) => SizedBox(height: Units().spacing),
              ),
            ),
          ],
        );
      }).toList();
    }

    return Scaffold(
      appBar: const PreferredSize(preferredSize: Size.fromHeight(kToolbarHeight), child: AppBarWidget(title: "Settings")),
      body: Padding(
        padding: EdgeInsets.all(Units().spacing),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...renderSettings(),
              ButtonWidget(action: () => Navigator.pushNamed(context, "/auth"), label: "Sign out", labelColor: const Color(0xFFFFFFFF), backgroundColor: GlobalColors().red),
              SizedBox(height: Units().spacing),
              Center(child: Text("Version 1.0.0", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: GlobalColors().grey))),
            ],
          ),
        ),
      ),
    );
  }
}

class Setting extends StatelessWidget {
  final IconData icon;
  final String title;

  const Setting({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: GlobalColors().grey, size: 24),
        SizedBox(width: Units().spacing / 2),
        Text(title, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: GlobalColors().grey)),
        const Spacer(),
        Icon(PhosphorIcons.thin.caretRight, color: GlobalColors().grey, size: 24),
      ],
    );
  }
}
