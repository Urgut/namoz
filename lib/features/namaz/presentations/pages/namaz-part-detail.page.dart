import 'package:flutter/material.dart';
import 'package:namazapp/features/namaz/data/interfaces/part-iterface.dart';
import 'package:namazapp/localization.dart';

class NamazPartDetailPage extends StatefulWidget {
  final params;
  NamazPartDetailPage(this.params);

  @override
  _NamazPartDetailPageState createState() => _NamazPartDetailPageState();
}

class _NamazPartDetailPageState extends State<NamazPartDetailPage> {
  int partIndex = 0;
  int partsLength;
  List<IPart> parts = [];

  @override
  Widget build(BuildContext context) {
    this.parts = this.widget.params['parts'];
    this.partsLength = this.parts.length;

    return Scaffold(
      appBar: appBar(),
      body: buildContent(),
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
              this.widget.params['period'],
            ) +
            ": " +
            AppLocalizations.of(context).translate(
              this.widget.params['namazTitle'],
            ),
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget buildContent() {
    return Container(
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => goPrev(),
          ),
          getPart(this.partIndex),
          IconButton(
              icon: Icon(Icons.arrow_forward_ios), onPressed: () => goNext()),
        ],
      ),
    );
  }

  Widget getPart(int index) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Text(this.parts[index].title),
      ),
    );
  }

  goNext() {
    if (this.partIndex < (this.partsLength - 1)) {
      setState(() {
        this.partIndex++;
      });
    }
  }

  goPrev() {
    if (this.partIndex > 0) {
      setState(() {
        this.partIndex--;
      });
    }
  }
}
