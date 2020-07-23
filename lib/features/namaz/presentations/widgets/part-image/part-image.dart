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
      padding: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      color: Color(0XFFF9F9F9),
      // decoration: BoxDecoration(
      //   border: Border.all(width: 1)
      // ),
      child: Image.asset(
        this.widget.image,
        height: 200,
      ),
    );
  }
}
