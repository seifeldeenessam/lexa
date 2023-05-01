import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lexa/utilities/constants.dart';
import 'package:lexa/viewmodels/introduction.dart';
import 'package:lexa/widgets/button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(Main().background, fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.all(Units().spacing),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FittedBox(
                  child: Padding(
                    padding: EdgeInsets.all(Units().spacing * 8),
                    child: SvgPicture.asset(Main().logo, colorFilter: const ColorFilter.mode(Color(0xFFFFFFFF), BlendMode.srcIn)),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: FittedBox(
                      child: Text(
                        Main().solgan,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: const Color(0xFFFFFFFF), fontSize: 64, fontWeight: FontWeight.w200, height: 0.9),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Units().spacing),
                Row(
                  children: [
                    Expanded(
                      child: ButtonWidget(
                        action: () => Navigator.pushNamed(context, "/auth/phone-number/enter"),
                        label: "Get started",
                        labelColor: const Color(0xFFFFFFFF),
                        backgroundColor: const Color(0xFF151515),
                      ),
                    ),
                    SizedBox(width: Units().spacing / 2),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, "/auth"),
                      child: Container(
                        padding: EdgeInsets.all(Units().spacing / 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(Units().spacing * 2),
                        ),
                        child: PhosphorIcon(
                          PhosphorIcons.light.signIn,
                          color: const Color(0xFF000000),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
