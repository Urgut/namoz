import 'package:flutter/material.dart';

class AppWrapperWidget {
  /*
    Wrapp page with padding
  */
  static Widget wrapPageWithPadding({
    @required Widget page,
    double top = 20,
    double right = 20,
    double bottom = 20,
    double left = 20,
  }) {
    return Container(
      padding: EdgeInsets.only(
        top: top,
        right: right,
        bottom: bottom,
        left: left,
      ),
      child: page,
    );
  }

  /*
    Add spacing vertically to the widget
  */
  static Widget wrapWidgetWithPadding({
    @required Widget w,
    double paddingSize = 10,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: paddingSize),
      child: w,
    );
  }

  /*
    Align to the left text widget
  */
  static Widget alignTextToTheLeft({
    @required w,
  }) {
    return Container(
      width: double.infinity,
      child: w,
    );
  }

  /*
    Wrap widget with border
  */
  static Widget wrapWithBorder({@required Widget w}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.green,
        ),
      ),
      child: w,
    );
  }
}
