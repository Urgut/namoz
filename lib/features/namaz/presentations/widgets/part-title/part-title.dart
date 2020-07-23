import 'package:flutter/material.dart';

class PartTitle extends StatelessWidget {
  final String title;
  PartTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
