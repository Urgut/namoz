import 'package:flutter/material.dart';

class NamazPartText extends StatefulWidget {
  final List<String> texts;
  NamazPartText({this.texts});

  @override
  _NamazPartTextState createState() => _NamazPartTextState();
}

class _NamazPartTextState extends State<NamazPartText> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[],
      ),
    );
  }


  List<Widget> buildTabs(){
    
  }
}
