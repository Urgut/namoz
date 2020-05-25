import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namazapp/features/namaz/bloc/namaz-bloc.dart';
import 'package:namazapp/features/namaz/bloc/namaz-state.dart';
import 'package:namazapp/features/namaz/data/models/namaz-model.dart';
import 'package:namazapp/shared/widgets/empty.dart';
import 'package:namazapp/shared/widgets/error.dart';
import 'package:namazapp/shared/widgets/spinner/spinner.dart';

class NamazPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Намаз үйрену'),
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
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(child: Text(n.title ?? '')),
          Container(child: Text(n.mode ?? '')),
        ],
      ),
    );
  }
}
