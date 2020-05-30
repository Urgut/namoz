import 'package:flutter/material.dart';

class NamazListPage extends StatefulWidget {
  final params;
  NamazListPage(this.params);

  @override
  _NamazListPageState createState() => _NamazListPageState();
}

class _NamazListPageState extends State<NamazListPage> {
  String gender;

  @override
  void initState() {
    gender = widget.params['gender'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Намаз'),
      ),
      body: buildContent(),
    );
  }

  Widget buildContent() {
    return Container(
      child: Text('Namaz: $gender'),
    );
  }
}
