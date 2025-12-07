import 'package:absolute_cinema/widgets/logo.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LargeLogo(),
            SizedBox(height: 20),
            Text("Are You Ready to Witness Absolute Cinema?"),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/movie-list'),
              child: Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
