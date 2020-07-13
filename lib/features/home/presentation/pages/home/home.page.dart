import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namazapp/core/model/route.model.dart';
import 'package:namazapp/features/home/bloc/sections-bloc.dart';
import 'package:namazapp/features/home/bloc/sections-state.dart';
import 'package:namazapp/features/home/data/models/section.model.dart';
import 'package:namazapp/features/home/presentation/widgets/main-menu/main-menu.dart';
import 'package:namazapp/shared/widgets/cover/cover.dart';
import 'package:namazapp/shared/widgets/empty.dart';
import 'package:namazapp/shared/widgets/error/error.dart';
import 'package:namazapp/shared/widgets/spinner/spinner.dart';

class HomePage extends StatelessWidget {
  double width;
  double height;

  @override
  Widget build(BuildContext context) {
    this.width = MediaQuery.of(context).size.width;
    this.height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Намаз',
          style: TextStyle(color: Color(0XFA0064AA0).withOpacity(0.9)),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0XFFFAFAFA),
      ),
      body: BlocBuilder(
        bloc: BlocProvider.of<SectionsBloc>(context),
        builder: (ctx, SectionsState state) {
          // Loading
          if (state is SectionsLoading) {
            return AppSpinner();
          }

          // Loaded
          if (state is SectionsLoaded) {
            return buildStack();
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

  buildStack() {
    return Stack(
      fit: StackFit.loose,
      alignment: Alignment.bottomCenter,
      children: [
        new Container(color: Color(0XFFFAFAFA)),
        new Image.asset(
          "assets/images/faq.png",
          fit: BoxFit.fitWidth,
        ),
        // Positioned.fill(child: Text('Content')),
        Positioned.fill(
          bottom: 60,
          child: Container(
            // decoration: BoxDecoration(border: Border.all(width: 4, color: Colors.green)),
            child: Text('Content'),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: MainMenu(),
          ),
        ),
      ],
    );
  }

  // buildContent(List<SectionModel> sections) {
  //   return Container(
  //     child: GridView.builder(
  //         padding: EdgeInsets.all(20),
  //         itemCount: sections.length,
  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //           crossAxisCount: 2,
  //           mainAxisSpacing: 20,
  //           crossAxisSpacing: 20,
  //         ),
  //         itemBuilder: (ctx, index) => this.sectionBuilder(sections[index])),
  //   );
  // }

  // sectionBuilder(SectionModel section) {
  //   return CoverUI(
  //     title: section.title,
  //     image: section.image,
  //     route: RouteModel(route: section.route, arguments: {}),
  //   );
  // }
}
