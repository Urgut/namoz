import 'package:flutter/material.dart';

class NamazShortPart extends StatefulWidget {
  final String title;

  NamazShortPart(this.title);

  @override
  _NamazShortPartState createState() => _NamazShortPartState();
}

class _NamazShortPartState extends State<NamazShortPart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Text(
        this.widget.title,
        style: TextStyle(
          fontSize: 12,
          color: Colors.black.withOpacity(0.5),
        ),
      ),
    );
  }
}
