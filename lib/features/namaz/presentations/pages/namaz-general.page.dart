import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namazapp/core/constants/routes.dart';
import 'package:namazapp/core/services/navigation.service.dart';
import 'package:namazapp/features/namaz/bloc/namaz-bloc.dart';
import 'package:namazapp/features/namaz/bloc/namaz-events.dart';
import 'package:namazapp/features/namaz/bloc/namaz-state.dart';
import 'package:namazapp/features/namaz/data/datasources/namaz-oop-data.dart';
import 'package:namazapp/features/namaz/data/interfaces/part-iterface.dart';
import 'package:namazapp/features/namaz/data/models/namaz-rakaat.model.dart';
import 'package:namazapp/features/namaz/data/models/namaz-wrapper.model.dart';
import 'package:namazapp/features/namaz/data/namaz/namaz.dart';
import 'package:namazapp/features/namaz/presentations/widgets/namaz-part/namaz-part.dart';
import 'package:namazapp/features/namaz/presentations/widgets/part-image/part-image.dart';
import 'package:namazapp/localization.dart';
import 'package:namazapp/locator.dart';
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
  NavigationService _navService = locator<NavigationService>();
  int selectedTab = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (ctx) => NamazBloc(repos: new NamazOOPDataRepository())
                  ..add(LoadNamazEvent(
                    period: this.widget.params['period'],
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
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      leading: IconButton(
        icon: Icon(Icons.close, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
      elevation: 0,
      title: Text(
        AppLocalizations.of(context).translate(
          this.widget.params['period'],
        ),
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget buildContent(NamazWrapper nw) {
    return AppWrapperWidget.wrapPageWithPadding(
        page: doTab(nw), bottom: 0, top: 0);
  }

  Widget doTab(NamazWrapper nw) {
    return DefaultTabController(
      length: nw.namazList.length,
      child: Column(
        children: [
          TabBar(
            onTap: (index) {
              this.selectedTab = index;
            },
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
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: scrollContent(n),
          ),
          SizedBox(
            width: double.infinity,
            child: RaisedButton(
              onPressed: () => onGo(n),
              child: Text(
                'КӨРУ',
                style: TextStyle(color: Colors.white),
              ),
              color: Color(0XFF0065A0).withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }

  onGo(Namaz n) {
    this._navService.navigateTo(Routes.namazPartDetailPage, arguments: {
      "period": n.period,
      "namazTitle": n.title,
      "rakaats": n.rakaats,
      "parts": n.parts,
    });
  }

  Widget scrollContent(Namaz n) {
    return SingleChildScrollView(
      child: Container(
        child: Column(children: [
          SizedBox(height: 10),
          PartImage(image: 'assets/images/namaz/man/kiyam.png'),
          SizedBox(height: 10),
          Container(
            child: Text(
              AppLocalizations.of(context).translate('okulu_reti'),
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            width: double.infinity,
          ),
          SizedBox(height: 10),
          buildRakats(n.rakaats),
        ]),
      ),
    );
  }

  Widget buildRakats(List<NamazRakaatModel> rakaats) {
    List<Widget> rakaatsUI = [];

    if (rakaats != null) {
      for (int i = 0; i < rakaats.length; i++) {
        Widget rakaatEachUI = buildRakaatItem(rakaats[i]);
        rakaatsUI.add(rakaatEachUI);
      }
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: rakaatsUI,
      ),
    );
  }

  Widget buildRakaatItem(NamazRakaatModel r) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context).translate(r.title),
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 5),
          buildParts(r.parts),
        ],
      ),
    );
  }

  Widget buildParts(List<IPart> parts) {
    List<Widget> result = [];

    for (int i = 0; i < parts.length; i++) {
      result.add(NamazShortPart(parts[i].title));
      result.add(Text(
        "|",
        style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.3)),
      ));
    }

    return Container(
      child: Wrap(
        children: result,
      ),
    );
  }
}
