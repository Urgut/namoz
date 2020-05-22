import 'package:flutter/material.dart';
import 'package:namazapp/core/constants/pages-header.dart';
import 'package:namazapp/core/constants/routes.dart';
import 'package:namazapp/ui/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: PagesHeader.home,
      initialRoute: Routes.taharatPage,
      onGenerateRoute: Router.generateRoute,
      // Оборачиваем все дочерные виджеты Bloc-ом. Теперь каждый дочерный виджет имеет доступ к counterBlock
      // home: BlocProvider(
      //   create: (ctx) => BookBloc(),
      //   child: MyHomePageState(),
      // ),
    );
  }
}

// class MyHomePageState extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Access to instance of counterBlock via wrapped Provider
//     final BookBloc counterBloc = BlocProvider.of<BookBloc>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(PagesHeader.home),
//       ),
//       // Subscribe to counterState
//       body: BlocBuilder<BookBloc, BookState>(
//         bloc: counterBloc,
//         builder: (ctx, state) {
//           if (state is BookLoading) {
//             return CircularProgressIndicator();
//           }

//           if (state is BookSuccess) {
//             return Center(
//               child: Text(state.b.title),
//             );
//           }

//           return Container();
//         },
//       ),
//       floatingActionButton: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           FloatingActionButton(
//             onPressed: () => counterBloc.add(BookEvent.loadBookDetail),
//             child: Icon(Icons.book),
//           ),
//         ],
//       ),
//     );
//   }
// }
