import 'package:aflutterapp/post.dart';
import 'package:aflutterapp/posts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsView extends StatelessWidget {
  const PostsView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Posts')),
        backgroundColor: Colors.black38,
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<PostsCubit, List<Post>>(builder: (context, posts) {
        if (posts.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.black38,),
          );
        }
        return ListView.builder(itemBuilder: (context, index){
          return Card(
            child: ListTile(
              title: Text(posts[index].title),
            ),
          );
        });
      } ,),
    );
  }
}