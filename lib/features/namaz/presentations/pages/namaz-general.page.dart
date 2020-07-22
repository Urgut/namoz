import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namazapp/features/namaz/bloc/namaz-bloc.dart';
import 'package:namazapp/features/namaz/bloc/namaz-events.dart';
import 'package:namazapp/features/namaz/bloc/namaz-state.dart';
import 'package:namazapp/features/namaz/data/datasources/namaz-oop-data.dart';
import 'package:namazapp/features/namaz/data/models/namaz-rakaat.model.dart';
import 'package:namazapp/features/namaz/data/models/namaz-wrapper.model.dart';
import 'package:namazapp/features/namaz/data/namaz/base-namaz.dart';
import 'package:namazapp/features/namaz/data/namaz/namaz.dart';
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
                    namazTitle: this.widget.params['namazTitle'],
                    gender: this.widget.params['gender'],
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

  Widget appBar() {
    return AppBar(
      title: Text(
        AppLocalizations.of(context)
            .translate(this.widget.params['namazTitle']),
      ),
    );
  }

  Widget buildContent(NamazWrapper nw) {
    return AppWrapperWidget.wrapPageWithPadding(
      page: doTab(nw),
    );
  }

  Widget doTab(NamazWrapper nw) {
    return DefaultTabController(
      length: nw.namazList.length,
      child: Column(
        children: [
          TabBar(
            labelColor: Colors.blue,
            tabs: this.buildTabHeaders(nw.namazList),
          ),
          Expanded(
            child: TabBarView(
              children: this.buildTabContents(nw.namazList),
            ),
          )
        ],
      ),
    );
  }

  /*
    Build tab's header
  */
  List<Widget> buildTabHeaders(List<Namaz> namazList) {
    List<Widget> tabs = [];

    // Guard
    if (namazList == null) {
      throw Exception('No rakaatsF');
    }

    // Build rakaats
    for (Namaz n in namazList) {
      Widget label = this.buildEachTabHeader(n.title);
      tabs.add(label);
    }

    return tabs;
  }

  Widget buildEachTabHeader(String t) {
    return Tab(
      child: Text(
        AppLocalizations.of(context).translate(t),
        style: TextStyle(fontSize: 12),
      ),
    );
  }

  /*
    Build tab's content
  */
  List<Widget> buildTabContents(List<Namaz> namazList) {
    List<Widget> contents = [];

    if (namazList == null) {
      throw AppEmpty();
    }

    for (dynamic n in namazList) {
      Widget c = this.buildTabContent(n);
      contents.add(c);
    }

    return contents;
  }

  Widget buildTabContent(Namaz n) {
    return Container(
      child: Column(
        children: [
          buildImage(),
          SizedBox(height: 10),
          Text('Оқылу реті'),
          Text(n.title),
          Text(n.rakaats.length.toString()),
        ],
      ),
    );
  }

  Widget buildImage() {
    return Container(child: Image.asset('assets/images/namaz/kiyam.png'));
  }
}
