import 'package:aflutterapp/data_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: const EdgeInsets.symmetric(vertical: 50),
              child: SizedBox(
                width: 150,
                child: TextField(
                  controller: _cityTextController,
                  decoration: const InputDecoration(labelText: 'City'),
                  textAlign: TextAlign.center,
                ),
              ),),
              ElevatedButton(onPressed: _search, child: const Text('Search'))
            ],
          ),
        ),
      ),
    );
  }
  
  void _search(){
    _dataService.getWeather(_cityTextController.text);
  }
}
