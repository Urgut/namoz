import 'package:flutter/material.dart';
import 'package:namazapp/core/model/route.model.dart';
import 'package:namazapp/core/services/navigation.service.dart';
import 'package:namazapp/locator.dart';

class CoverUI extends StatefulWidget {
  final String image;
  final String title;
  final RouteModel route;
  final BoxFit mode;

  CoverUI({
    this.image,
    this.title,
    this.route,
    this.mode,
  });

  @override
  _CoverUIState createState() => _CoverUIState();
}

class _CoverUIState extends State<CoverUI> {
  // DI
  NavigationService _navService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    Size widgetSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => _navService.navigateTo(
        this.widget.route.route,
        arguments: this.widget.route.arguments,
      ),
      child: Container(
        height: widgetSize.height * 0.7,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Stack(
            children: [
              backgroundImage(this.widget.image),
              bgGradient(),
              itemTitle(this.widget.title),
            ],
          ),
        ),
      ),
    );
  }

  Widget backgroundImage(String image) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(new Radius.circular(10)),
          image: DecorationImage(
            image: AssetImage('${this.widget.image}'),
            fit: this.widget.mode ?? BoxFit.cover,
          ),
        ),
      );

  Widget bgGradient() => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(new Radius.circular(10)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF000000).withOpacity(0),
              const Color(0xFF000000).withOpacity(0),
              Color(0xFF000000).withOpacity(0.6),
            ],
          ),
        ),
      );

  Widget itemTitle(String title) => Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Text(
            title,
            style: titleStyle,
          ),
        ),
      );

  TextStyle titleStyle = TextStyle(color: Colors.white, fontSize: 15);
}
