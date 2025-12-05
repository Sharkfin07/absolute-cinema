import 'package:absolute_cinema/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:absolute_cinema/theme/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      home: Scaffold(
        body: Center(child: Column(children: [SmallLogo(), LargeLogo()])),
      ),
    );
  }
}
