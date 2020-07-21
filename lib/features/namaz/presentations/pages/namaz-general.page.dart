import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namazapp/features/namaz/bloc/namaz-bloc.dart';
import 'package:namazapp/features/namaz/bloc/namaz-events.dart';
import 'package:namazapp/features/namaz/bloc/namaz-state.dart';
import 'package:namazapp/features/namaz/data/datasources/namaz-oop-data.dart';
import 'package:namazapp/features/namaz/data/models/namaz-rakaat.model.dart';
import 'package:namazapp/features/namaz/data/namaz/base-namaz.dart';
import 'package:namazapp/localization.dart';
import 'package:namazapp/shared/widgets/empty.dart';
import 'package:namazapp/shared/widgets/error/error.dart';
import 'package:namazapp/shared/widgets/spinner/spinner.dart';
import 'package:namazapp/shared/widgets/wrapper.dart';

class NamazGeneralPage extends StatefulWidget {
  final params;
  NamazGeneralPage(this.params);

  @override
  _NamazGeneralPageState createState() => _NamazGeneralPageState();
}

class _NamazGeneralPageState extends State<NamazGeneralPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (ctx) => NamazBloc(repos: new NamazOOPDataRepository())
                  ..add(LoadNamazEvent(
                    gender: this.widget.params['gender'],
                    namazTitle: this.widget.params['namazTitle'],
                    namazType: this.widget.params['namazType'],
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
              children: this.buildTabContent(n),
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
    rakaats = rakaats.where((e) => e.isRakaat == true);
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
  List<Widget> buildTabContent(BaseNamaz n) {
    List<Widget> contents = [];

    if (n.rakaats == null) {
      throw AppEmpty();
    }

    for (dynamic i in n.rakaats) {
      // Widget r = this.buildEachRakaat(i);
      // contents.add(r);
    }

    return contents;
  }

  Widget appBar() {
    return AppBar(
      title: Text(
        AppLocalizations.of(context)
            .translate(this.widget.params['namazTitle']),
      ),
    );
  }
}
