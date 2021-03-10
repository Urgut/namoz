import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:namazapp/features/namaz/data/interfaces/part-iterface.dart';
import 'package:namazapp/features/namaz/presentations/widgets/part-image/part-image.dart';
import 'package:namazapp/features/namaz/presentations/widgets/part-title/part-title.dart';
import 'package:namazapp/localization.dart';
import 'package:namazapp/shared/widgets/audioplayer/app-player.dart';
import 'package:namazapp/shared/widgets/theme-appbar/theme-appbar.dart';
import 'package:namazapp/shared/widgets/wrapper.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

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

  // Tab
  int selectedMenuIndex = 0;

  List<String> menuHeaderData = [];
  List<String> menuContentData = [];

  double width;

  @override
  void initState() {
    super.initState();

    this.parts = this.widget.params['parts'];
    this.partsLength = this.parts.length;
  }

  @override
  Widget build(BuildContext context) {
    this.width = MediaQuery.of(context).size.width;

    reBuildMenu();

    return Scaffold(
      appBar: ThemeAppBar(this.header()),
      body: AppWrapperWidget.wrapPageWithPadding(
        top: 0,
        bottom: 0,
        page: getPart(this.partIndex),
      ),
      backgroundColor: Colors.white,
    );
  }

  header() => Text(
        AppLocalizations.of(context).translate(
              this.widget.params['period'],
            ) +
            ": " +
            AppLocalizations.of(context).translate(
              this.widget.params['namazTitle'],
            ),
        style: TextStyle(color: Colors.black),
      );

  reBuildMenu() {
    // Reset
    menuHeaderData = [];
    menuContentData = [];

    IPart part = this.parts[this.partIndex];

    // Transcript
    if (part.transcript != null && part.transcript != "") {
      menuHeaderData.add("TR");
      menuContentData.add(part.transcript);
    }

    // Transltion
    if (part.translation != null && part.translation != "") {
      menuHeaderData.add("KZ");
      menuContentData.add(part.translation);
    }

    // Arabic
    if (part.arabic != null && part.arabic != "") {
      menuHeaderData.add("AR");
      menuContentData.add(part.arabic);
    }

    // Description
    if (part.description != null && part.description != "") {
      menuHeaderData.add("IN");
      menuContentData.add(part.description + part.comment);
    }
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
      child: Icon(Icons.arrow_back_ios, color: Color(0XFF3E4352)),
      onTap: this.partIndex == 0 ? null : () => goPrev(),
    );
  }

  Widget nextButtonUI() {
    return GestureDetector(
        child: Icon(Icons.arrow_forward_ios, color: Color(0XFF3E4352)),
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
            proggressBar(),
            PartImage(image: part.image),
            SizedBox(height: 16),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  rakaatLabelUI(part.rakaatName),
                  partMenu(),
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

  Widget proggressBar() {
    return Container(
      width: double.infinity,
      child: LinearPercentIndicator(
        padding: EdgeInsets.zero,
        percent: this.getPercentage(),
        animation: true,
        progressColor: Color(0XFFF2C94D),
        backgroundColor: Colors.white,
      ),
    );
  }

  getPercentage() {
    double onePercentageValue = (100 / this.parts.length);
    double result = partIndex == this.parts.length - 1
        ? 1
        : (this.partIndex * onePercentageValue) / 100;
    print('Percentage: $result');
    return result;
  }

  Widget partMenu() {
    return Container(
      child: Row(
        children: this.menuHeaderData.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => onPartMenuChanged(entry.key),
            child: Container(
              child: Text(
                entry.value,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: entry.key == selectedMenuIndex
                      ? Colors.white
                      : Color(0XFF3E4352),
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
              // width: 30,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.all(Radius.circular(15)),
                shape: BoxShape.circle,
                color: entry.key == selectedMenuIndex
                    ? Color(0XFF3E4352)
                    : Color(0XFFE5E5E5),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  onPartMenuChanged(index) {
    setState(() {
      this.selectedMenuIndex = index;
    });
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
    return Text(
      AppLocalizations.of(context).translate(l) + ':',
      style: TextStyle(fontSize: 16, color: Color(0XFF3F3D56)),
    );
  }

  goPrev() {
    if (this.partIndex > 0) {
      setState(() {
        this.selectedMenuIndex = 0;
        this.partIndex--;
      });
    }
  }

  goNext() {
    if (this.partIndex < (this.partsLength - 1)) {
      setState(() {
        this.partIndex++;
        this.selectedMenuIndex = 0;
      });
    }
  }

  Widget textUI(String t) {
    return this.menuContentData.length > 0 &&
            this.menuContentData[this.selectedMenuIndex] != null
        ? Container(
            child: Row(
              children: [
                prevButtonUI(),
                Expanded(
                  child: Html(
                    data: this.menuContentData[this.selectedMenuIndex],
                    padding: EdgeInsets.all(5),
                    customTextAlign: (elem) => TextAlign.center,
                  ),
                ),
                nextButtonUI(),
              ],
            ),
          )
        : Container();
  }
}
