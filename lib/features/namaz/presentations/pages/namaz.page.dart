import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namazapp/features/namaz/bloc/namaz-bloc.dart';
import 'package:namazapp/features/namaz/bloc/namaz-state.dart';
import 'package:namazapp/features/namaz/data/models/namaz-model.dart';
import 'package:namazapp/features/namaz/data/models/namaz-part.model.dart';
import 'package:namazapp/features/namaz/data/models/namaz-rakaat.model.dart';
import 'package:namazapp/shared/widgets/empty.dart';
import 'package:namazapp/shared/widgets/error.dart';
import 'package:namazapp/shared/widgets/spinner/spinner.dart';
import 'package:namazapp/shared/widgets/wrapper.dart';

class NamazPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Таң намазы'),
      ),
      body: BlocBuilder(
        bloc: BlocProvider.of<NamazBloc>(context),
        builder: (ctx, NamazState state) {
          // Loading
          if (state is NamazLoading) {
            return AppSpinner();
          }

          // Loaded
          if (state is NamazLoaded) {
            return buildContent(state.data);
          }

          // Error
          if (state is NamazFailure) {
            return AppError(error: state.error);
          }

          // Default
          return AppEmpty();
        },
      ),
    );
  }

  Widget buildContent(NamazModel n) {
    return AppWrapperWidget.wrapPageWithPadding(
      page: doTab(n),
    );
  }

  Widget doTab(NamazModel n) {
    return DefaultTabController(
      length: n.rakaats.length,
      child: Column(
        children: [
          TabBar(
            labelColor: Colors.blue,
            tabs: this.buildTabHeaders(n.rakaats),
          ),
          Expanded(
            child: TabBarView(
              children: this.buildTabContent(n.rakaats),
            ),
          )
        ],
      ),
    );
  }

  /*
    Build tab's header
  */
  List<Widget> buildTabHeaders(List<NamazRakaatModel> rakaats) {
    List<Widget> tabs = [];

    // Guard
    if (rakaats == null) {
      throw Exception('No rakaatsF');
    }

    // Build rakaats
    for (dynamic r in rakaats) {
      Widget rakatUI = this.buildEachTabHeader(r);
      tabs.add(rakatUI);
    }

    return tabs;
  }

  Widget buildEachTabHeader(NamazRakaatModel r) {
    return Tab(
      child: Text(
        r.title,
        style: TextStyle(fontSize: 12),
      ),
    );
  }

  /*
    Build tab's content
  */
  List<Widget> buildTabContent(List<NamazRakaatModel> rakaats) {
    List<Widget> contents = [];

    if (rakaats == null) {
      throw Exception('No content');
    }

    for (dynamic i in rakaats) {
      Widget r = this.buildEachRakaat(i);
      contents.add(r);
    }

    return contents;
  }

  Widget buildEachRakaat(NamazRakaatModel r) {
    List<Widget> parts = [];

    for (NamazPartModel p in r.parts) {
      // Title
      if (p.title != null) {
        Widget title = AppWrapperWidget.wrapWidgetWithPadding(
          w: this.buildPartHeader(p.title),
        );
        parts.add(title);
      }

      // Desc
      if (p.description != null) {
        Widget desc = AppWrapperWidget.wrapWidgetWithPadding(
          w: AppWrapperWidget.alignTextToTheLeft(
            w: Text(p.description),
          ),
        );
        parts.add(desc);
      }

      // Image
      if (p.image != null) {
        Widget image = AppWrapperWidget.wrapWidgetWithPadding(
          w: Image.asset(
            p.image,
            height: 300,
          ),
        );
        parts.add(image);
      }
    }

    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: parts,
        ),
      ),
    );
  }

  Widget buildPartHeader(String h) => AppWrapperWidget.alignTextToTheLeft(
        w: Text(
          h,
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.start,
        ),
      );
}
