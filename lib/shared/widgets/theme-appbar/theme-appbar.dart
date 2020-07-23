import 'package:flutter/material.dart';

class ThemeAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget title;

  ThemeAppBar(this.title);

  @override
  Widget build(BuildContext context) {
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
        title: title);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
