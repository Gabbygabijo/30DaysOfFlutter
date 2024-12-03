import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(133, 182, 180, 72),
          title: const Text('Hello: Flutter is fun'),
        ),
        body: Center(
          child: Container(
            color: const Color(0xD1BEBEBE),
            width: 300,
            height: 200,
            padding: const EdgeInsets.all(20),
            child: const Text(
              'Hi People', 
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 39,
                fontWeight: FontWeight.normal
              ),),
          ),
        ),
      ),
    );
  }
}