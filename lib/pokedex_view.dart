import 'package:flutter/material.dart';

class PokedexView extends StatelessWidget{
  const PokedexView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Pokedex'),),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
    );
  }
}