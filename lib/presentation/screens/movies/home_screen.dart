import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'Home-Screen';
  final Widget childView;

  const HomeScreen({super.key, required this.childView});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:childView,
      bottomNavigationBar: const CustomButtonNavegation(),
    );
  }
}
