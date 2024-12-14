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
  final _dataService = DataService();
  String? _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Builder(builder: (context) {
            if (_response != null) {
              return Text(_response!);
            } else {
              return ElevatedButton(
                  onPressed: _makeRequest, child: const Text('Make Request'));
            }
          }),
        ),
      ),
    );
  }

  void _makeRequest() async {
    final response = await _dataService.makeRequestToApi();
    setState(() {
      _response = response;
    });
  }
}
