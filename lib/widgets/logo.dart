import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const assetPath = "assets/icons/ac-icon.svg";

class SmallLogo extends StatelessWidget {
  const SmallLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final Color logoColor = isDark ? Colors.white : Colors.black;
    return Row(
      children: [
        SvgPicture.asset(
          assetPath,
          width: 40,
          colorFilter: ColorFilter.mode(logoColor, BlendMode.srcIn),
        ),
        SizedBox(width: 5),
        Text(
          "Absolute Cinema",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: logoColor,
          ),
        ),
      ],
    );
  }
}

class LargeLogo extends StatelessWidget {
  const LargeLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final Color logoColor = isDark ? Colors.white : Colors.black;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          assetPath,
          width: 100,
          colorFilter: ColorFilter.mode(logoColor, BlendMode.srcIn),
        ),
        SizedBox(height: 20),
        Text(
          "Absolute\nCinema",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ],
    );
  }
}
