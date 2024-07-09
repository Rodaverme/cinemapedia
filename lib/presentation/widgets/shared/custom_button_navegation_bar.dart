// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomButtonNavegation extends StatelessWidget {
  const CustomButtonNavegation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_max), label: 'Inicio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.label_outline), label: 'Categorias'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: 'Favoritos'),
        ]);
  }
}
