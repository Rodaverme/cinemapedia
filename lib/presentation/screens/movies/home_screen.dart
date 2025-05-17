
import 'package:cinemapedia/presentation/views/views.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

final int pageIndex;

  static const String name = 'home-screen';

  const HomeScreen({super.key, 
  required this.pageIndex});

  final viewRoutes =  const <Widget>[
    HomeView(),
    SizedBox(), // <--- categorias View
    FavoritesView(),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavegation(currentIndex: pageIndex ,)
    );
  }
}

