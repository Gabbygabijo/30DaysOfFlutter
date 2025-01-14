import 'package:aflutterapp/app_navigator.dart';
import 'package:aflutterapp/data_service.dart';
import 'package:aflutterapp/nav_cubit.dart';
import 'package:aflutterapp/posts_cubit.dart';
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
      home: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => NavCubit()),
        BlocProvider(
          create: (context) => PostsBloc(DataService())..add(LoadPostsEvent()),
        )
      ], child: AppNavigator()),
    );
  }
}
