import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namazapp/features/home/bloc/sections-bloc.dart';
import 'package:namazapp/features/home/bloc/sections-state.dart';
import 'package:namazapp/features/home/presentation/widgets/main-menu/main-menu.dart';
import 'package:namazapp/features/home/presentation/widgets/namaz-list/namaz-list.dart';
import 'package:namazapp/localization.dart';
import 'package:namazapp/shared/fonts/namaz_fonts.dart';
import 'package:namazapp/shared/widgets/empty.dart';
import 'package:namazapp/shared/widgets/error/error.dart';
import 'package:namazapp/shared/widgets/spinner/spinner.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double width;
  double height;

  @override
  Widget build(BuildContext context) {
    this.width = MediaQuery.of(context).size.width;
    this.height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: buildAppbar(),
      body: BlocBuilder(
        bloc: BlocProvider.of<SectionsBloc>(context),
        builder: (ctx, SectionsState state) {
          // Loading
          if (state is SectionsLoading) {
            return AppSpinner();
          }

          // Loaded
          if (state is SectionsLoaded) {
            return buildStackContent();
          }

          // Error
          if (state is SectionsFailure) {
            return AppError(error: state.error);
          }

          // Default
          return AppEmpty();
        },
      ),
    );
  }

  Widget buildAppbar() {
    return AppBar(
      title: Text(
        AppLocalizations.of(context).translate('namaz').toUpperCase(),
        style: TextStyle(color: Color(0XFA0064AA0).withOpacity(0.9)),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      actions: [
        IconButton(
            icon: Icon(
              NamazIcons.hijab,
              color: Colors.black.withOpacity(0.5),
              size: 25,
            ),
            onPressed: () {}),
      ],
      leading: IconButton(
          icon: Icon(
            NamazIcons.man,
            color: Color(0XFA0064AA0),
            size: 25,
          ),
          onPressed: () {}),
    );
  }

  buildStackContent() {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.bottomCenter,
      children: [
        buildBackgroundImage(),
        buildShortNamazList(),
        buildMenuContent(),
      ],
    );
  }

  Widget buildBackgroundImage() {
    return new Image.asset(
      "assets/images/man_bg.png",
      fit: BoxFit.fill,
    );
  }

  Widget buildShortNamazList() {
    return Positioned.fill(
      bottom: 45,
      child: Container(
        child: Container(
          padding: EdgeInsets.all(15),
          child: NamazList(),
        ),
      ),
    );
  }

  Widget buildMenuContent() {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: MainMenu(),
      ),
    );
  }
}
