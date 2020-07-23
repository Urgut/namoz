import 'package:flutter/material.dart';

class PartImage extends StatefulWidget {
  final String image;

  PartImage({@required this.image});

  @override
  _PartImageState createState() => _PartImageState();
}

class _PartImageState extends State<PartImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        this.widget.image,
        height: 200,
      ),
    );
  }
}
