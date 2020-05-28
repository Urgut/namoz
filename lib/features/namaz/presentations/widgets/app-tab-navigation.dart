import 'package:flutter/material.dart';
import 'package:namazapp/core/services/html.service.dart';

class AppTabNavigation extends StatefulWidget {
  final List<String> headers;
  final List<String> contents;

  AppTabNavigation({
    this.headers,
    this.contents,
  });

  @override
  _AppTabNavigationState createState() => _AppTabNavigationState();
}

class _AppTabNavigationState extends State<AppTabNavigation> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        this.buildHeaderWidget(),
        this.buildContent(),
      ],
    );
  }

  /*
    Build tab header
  */
  buildHeaderWidget() {
    if (this.widget.headers == null) {
      return null;
    }

    List<Widget> result = [];

    this.widget.headers.asMap().forEach((key, value) {
      Widget headerSingleUI = this.buildHeaderItem(value, key);

      result.add(headerSingleUI);
    });

    return Container(
      child: Row(
        children: result,
      ),
    );
  }

  /*
    Build single header
  */
  Widget buildHeaderItem(String h, int index) {
    Widget headerUI = Text(
      h,
      style: TextStyle(
          fontSize: 16, color: selected == index ? Colors.white : Colors.black),
    );

    return GestureDetector(
      onTap: () => onSelect(h, index),
      child: Container(
        padding: EdgeInsets.all(5),
        child: headerUI,
        decoration: BoxDecoration(
          border: Border.all(width: 0.3, color: Colors.black.withOpacity(0.5)),
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: selected == index ? Colors.blue : Colors.white,
        ),
        margin: EdgeInsets.all(5),
      ),
    );
  }

  onSelect(String h, int index) {
    setState(() {
      selected = index;
    });
  }

  Widget buildContent() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: HtmlService.convertToHtml(this.widget.contents[selected] ?? ''),
    );
  }
}
