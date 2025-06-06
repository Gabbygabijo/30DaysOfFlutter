import 'package:aflutterapp/bloc/pokemon_bloc.dart';
import 'package:aflutterapp/bloc/pokemon_event.dart';
import 'package:aflutterapp/pokedex_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
          primaryColor: Colors.red,
          colorScheme: Theme.of(context)
              .colorScheme
              .copyWith(secondary: Colors.redAccent)),
      home: MultiBlocProvider(providers: [
        BlocProvider(
            create: (context) =>
                PokemonBloc()..add(PokemonPageRequest(page: 0)))
      ], child: const PokedexView()),
    );
  }
}
