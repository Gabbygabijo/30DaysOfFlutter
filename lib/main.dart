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
  final _users = List.filled(20, 'Gabby');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white70,
          appBar: AppBar(
            bottom: const TabBar(tabs: [Text('List'), Text('Grid')]),
            backgroundColor: Colors.white30,
            // foregroundColor: Colors.white24,
          ),
          body: TabBarView(
            children: [_contentListView(), _constGridView()],
          ),
        ),
      ),
    );
  }

  Widget _contentListView() {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text(index.toString()),
          onTap: () => print('Hello $index'),
        ),
      ),
    );
  }

  Widget _constGridView() {
    return GridView.builder(
      itemCount: _users.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) =>
          Card(child: GridTile(child: Center(child: Text(_users[index])))),
    );
  }
}
