import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namazapp/core/constants/routes.dart';
import 'package:namazapp/core/services/navigation.service.dart';
import 'package:namazapp/features/home/bloc/sections-bloc.dart';
import 'package:namazapp/features/home/bloc/sections-state.dart';
import 'package:namazapp/features/home/data/models/section.model.dart';
import 'package:namazapp/locator.dart';
import 'package:namazapp/shared/widgets/empty.dart';
import 'package:namazapp/shared/widgets/error.dart';
import 'package:namazapp/shared/widgets/spinner/spinner.dart';

class HomePage extends StatelessWidget {
  // DI
  NavigationService _navService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Басты бет'),
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
            return buildContent(state.data);
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

  buildContent(List<SectionModel> sections) {
    return Container(
      child: GridView.builder(
          padding: EdgeInsets.all(20),
          itemCount: sections.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          itemBuilder: (ctx, index) => this.sectionBuilder(sections[index])),
    );
  }

  sectionBuilder(SectionModel section) {
    return GestureDetector(
      onTap: () => onSelectSection(section.route),
      child: Container(
        decoration: BoxDecoration(border: Border.all(width: 0.3)),
        child: Text(section.title),
      ),
    );
  }

  onSelectSection(String path) {
    this._navService.navigateTo(path);
  }
}
