import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namazapp/core/services/html.service.dart';
import 'package:namazapp/features/taharat/bloc/taharat-bloc.dart';
import 'package:namazapp/features/taharat/bloc/taharat-state.dart';
import 'package:namazapp/features/taharat/data/models/taharat-model.dart';
import 'package:namazapp/shared/widgets/empty.dart';
import 'package:namazapp/shared/widgets/error/error.dart';
import 'package:namazapp/shared/widgets/spinner/spinner.dart';

class TaharatGeneralPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Дәрет алу'),
      ),
      body: BlocBuilder(
        bloc: BlocProvider.of<TaharatBloc>(context),
        builder: (ctx, TaharatState state) {
          // Loading
          if (state is TaharatLoading) {
            return AppSpinner();
          }

          // Loaded
          if (state is TaharatLoaded) {
            return buildItems(state.data);
          }

          // Error
          if (state is TaharatFailure) {
            return AppError(error: state.error);
          }

          // Default
          return AppEmpty();
        },
      ),
    );
  }

  Widget buildItems(List<TaharatModel> d) {
    return ListView.builder(
      itemCount: d.length,
      itemBuilder: (ctx, index) => buildItem(d[index]),
    );
  }

  Widget buildItem(TaharatModel t) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          this.buildTitleUI(t.title),
          this.buildDescriptionUI(t.description),
          this.buildImages(t.images),
        ],
      ),
    );
  }

  Widget buildTitleUI(String t) => Container(
          child: Text(
        t,
        style: TextStyle(fontSize: 18),
      ));

  Widget buildDescriptionUI(String d) => Container(
        child: HtmlService.convertToHtml(
          d,
        ),
      );

  Widget buildImages(List<String> images) {
    if (images == null) {
      return Container();
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: images.length,
      itemBuilder: (ctx, index) => imageBuilder(images[index]),
    );
  }

  Widget imageBuilder(String i) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, top: 10),
      child: Image.asset(
        i,
        width: 150,
        height: 150,
      ),
    );
  }
}
