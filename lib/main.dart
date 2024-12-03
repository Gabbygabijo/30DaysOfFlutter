import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<String> restaurants = [
    'McDonald\'s',
    'Rosceo\'s Chicken and Waffles',
    'Olive Garden',
    'Pizza Hut',
    'Panda Express',
    'Subway'
  ];

  int? currenIndex;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('What do you want to eat?'),
          if (currenIndex != null)
            Text(
              restaurants[currenIndex!],
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          const Padding(padding: EdgeInsets.only(top: 50)),
          TextButton(
            onPressed: () {
              updateIndex();
            },
            style: TextButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero)),
            child: const Text('Pick Retaurant'),
          )
        ],
      ))),
    );
  }

  void updateIndex() {
    final random = Random();
    final index = random.nextInt(restaurants.length);
    setState(() {
      currenIndex = index;
    });
  }
}
