import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../views/views.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'Home-Screen';
  final int pageIndex;
  const HomeScreen({super.key, required this.pageIndex});

  final viewRoutes = const <Widget>[HomeView(), SizedBox(), FavoritesView()];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: IndexedStack(
          index:  pageIndex,
          children: viewRoutes,


      ),
      bottomNavigationBar: CustomButtonNavegation(currentIndex:pageIndex ),
    );
  }
}
