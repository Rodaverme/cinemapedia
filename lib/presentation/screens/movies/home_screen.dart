
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

final Widget chilView;

  static const String name = 'home-screen';

  const HomeScreen({super.key, required this.chilView});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: chilView,
      bottomNavigationBar: CustomBottomNavegation(),
    );
  }
}

