import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namazapp/features/taharat/bloc/taharat-bloc.dart';
import 'package:namazapp/features/taharat/bloc/taharat-state.dart';
import 'package:namazapp/features/taharat/data/models/taharat-model.dart';

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
            return Center(child: CircularProgressIndicator());
          }

          // Loaded
          if (state is TaharatLoaded) {
            return buildItems(state.data);
          }

          // Error
          if (state is TaharatFailure) {
            return Center(child: Text(state.error));
          }

          // Default
          return Container(
            child: Center(
              child: Text('Empty'),
            ),
          );
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
          Container(
            child: Text(t.title),
          ),
          Container(
            child: Text(t.description),
          )
        ],
      ),
    );
  }
}
