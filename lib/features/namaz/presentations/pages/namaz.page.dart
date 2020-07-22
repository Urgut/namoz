import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namazapp/core/services/html.service.dart';
import 'package:namazapp/features/namaz/bloc/namaz-bloc.dart';
import 'package:namazapp/features/namaz/bloc/namaz-events.dart';
import 'package:namazapp/features/namaz/bloc/namaz-state.dart';
import 'package:namazapp/features/namaz/data/datasources/namaz-oop-data.dart';
import 'package:namazapp/features/namaz/data/interfaces/part-iterface.dart';
import 'package:namazapp/features/namaz/data/models/namaz-rakaat.model.dart';
import 'package:namazapp/features/namaz/data/namaz/base-namaz.dart';
import 'package:namazapp/features/namaz/presentations/widgets/app-tab-navigation.dart';
import 'package:namazapp/localization.dart';
import 'package:namazapp/shared/widgets/audioplayer/app-player.dart';
import 'package:namazapp/shared/widgets/empty.dart';
import 'package:namazapp/shared/widgets/error/error.dart';
import 'package:namazapp/shared/widgets/spinner/spinner.dart';
import 'package:namazapp/shared/widgets/wrapper.dart';

class NamazPage extends StatefulWidget {
  final params;
  NamazPage(this.params);

  @override
  _NamazPageSate createState() => _NamazPageSate();
}

class _NamazPageSate extends State<NamazPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)
                .translate(this.widget.params['namazTitle']) +
            ': ' +
            AppLocalizations.of(context)
                .translate(this.widget.params['rakaatDesc'])),
      ),
      body: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (ctx) => NamazBloc(repos: new NamazOOPDataRepository())
                  ..add(LoadNamazEvent(
                    gender: this.widget.params['gender'],
                    namazTitle: this.widget.params['namazTitle'],
                  ))),
          ],
          child: Builder(builder: (context) {
            return BlocBuilder(
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
            );
          })),
    );
  }

  Widget buildContent(BaseNamaz n) {
    return AppWrapperWidget.wrapPageWithPadding(
      page: doTab(n),
    );
  }

  Widget doTab(BaseNamaz n) {
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
        AppLocalizations.of(context).translate(r.title),
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

    for (IPart p in r.parts) {
      // Title
      if (p.title != null) {
        Widget title = this.buildPartHeader(p.title);
        parts.add(title);
      }

      // Desc
      if (p.description != null) {
        Widget desc = AppWrapperWidget.wrapWidgetWithPadding(
          w: AppWrapperWidget.alignTextToTheLeft(
            w: HtmlService.convertToHtml(p.description),
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

      // text of namaz
      if (p.transcript != "" && p.translation != "" && p.arabic != "") {
        parts.add(
          AppTabNavigation(
            headers: ['Транскрипция', 'Аударма', 'Арабша'],
            contents: [
              p.transcript,
              p.translation,
              p.arabic,
            ],
          ),
        );
      }

      // Build Audio widget
      if (p.audio != null && p.audio.length > 0) {
        for (String a in p.audio) {
          Widget audio = AppPlayer(
            audioFilePath: a,
            basePath: 'assets/audio/namaz',
          );
          parts.add(audio);
        }
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
        w: Container(
          padding: EdgeInsets.only(bottom: 5, top: 15),
          child: Text(
            h,
            style: TextStyle(
                fontSize: 17, color: Colors.blue, fontWeight: FontWeight.w500),
            textAlign: TextAlign.start,
          ),
        ),
      );
}
