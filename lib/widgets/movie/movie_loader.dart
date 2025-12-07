import 'package:flutter/material.dart';

class MovieLoader extends StatelessWidget {
  const MovieLoader({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 30),
          Text("Absolute Cinema is Loading..."),
        ],
      ),
    );
  }
}
