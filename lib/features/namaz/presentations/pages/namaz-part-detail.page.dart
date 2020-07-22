import 'package:flutter/material.dart';
import 'package:namazapp/localization.dart';

class NamazPartDetailPage extends StatefulWidget {
  final params;
  NamazPartDetailPage(this.params);

  @override
  _NamazPartDetailPageState createState() => _NamazPartDetailPageState();
}

class _NamazPartDetailPageState extends State<NamazPartDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(),
    );
  }

  Widget appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      leading: IconButton(
        icon: Icon(Icons.close, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
      elevation: 0,
      title: Text(
        AppLocalizations.of(context).translate(
              this.widget.params['namazTitle'],
            ) +
            AppLocalizations.of(context).translate(
              this.widget.params['namazType'],
            ),
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
