import 'package:flutter/material.dart';

class PostsView extends StatelessWidget {
  const PostsView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: const Text('Posts')),
        backgroundColor: Colors.black38,
        foregroundColor: Colors.white,
      ),
    );
  }
}