import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:namazapp/features/namaz/data/interfaces/part-iterface.dart';
import 'package:namazapp/features/namaz/presentations/widgets/part-image/part-image.dart';
import 'package:namazapp/features/namaz/presentations/widgets/part-title/part-title.dart';
import 'package:namazapp/localization.dart';
import 'package:namazapp/shared/widgets/audioplayer/app-player.dart';
import 'package:namazapp/shared/widgets/wrapper.dart';

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
      body: AppWrapperWidget.wrapPageWithPadding(
        top: 0,
        bottom: 0,
        page: getPart(this.partIndex),
      ),
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

  Widget prevButtonUI() {
    return GestureDetector(
      child: Icon(Icons.arrow_back_ios, color: Colors.black.withOpacity(0.5)),
      onTap: this.partIndex == 0 ? null : () => goPrev(),
    );
  }

  Widget nextButtonUI() {
    return GestureDetector(
        child:
            Icon(Icons.arrow_forward_ios, color: Colors.black.withOpacity(0.5)),
        onTap:
            this.partIndex == (this.parts.length - 1) ? null : () => goNext());
  }

  Widget getPart(int index) {
    IPart part = this.parts[index];

    return Column(
      children: [
        mainContent(part),
        audioContent(part),
      ],
    );
  }

  Widget mainContent(IPart part) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            PartImage(image: part.image),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  rakaatLabelUI(part.rakaatName),
                  Text('Menu'),
                ],
              ),
            ),
            SizedBox(height: 35),
            PartTitle(part.title),
            SizedBox(height: 16),
            textUI(part.transcript),
          ],
        ),
      ),
    );
  }

  Widget audioContent(IPart part) {
    return part.audio != null && part.audio.length > 0
        ? Container(
            width: double.infinity,
            child: AppPlayer(
              audioFilePath: part.audio,
              basePath: 'assets/audio/namaz',
            ),
          )
        : Container();
  }

  Widget rakaatLabelUI(String l) {
    return Text(l);
  }

  goPrev() {
    if (this.partIndex > 0) {
      setState(() {
        this.partIndex--;
      });
    }
  }

  goNext() {
    if (this.partIndex < (this.partsLength - 1)) {
      setState(() {
        this.partIndex++;
      });
    }
  }

  Widget textUI(String t) {
    return Container(
      child: Row(
        children: [
          prevButtonUI(),
          Expanded(
            child: Html(
              data: t,
              padding: EdgeInsets.all(5),
              customTextAlign: (elem) => TextAlign.center,
            ),
          ),
          nextButtonUI(),
        ],
      ),
    );
  }
}
