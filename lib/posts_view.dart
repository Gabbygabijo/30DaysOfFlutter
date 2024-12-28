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
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is LoadingPostsState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black38,
              ),
            );
          } else if (state is LoadedPostsState) {
            return RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<PostsBloc>(context).add(PullToRefreshEvent());
              },
              child: ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(state.posts[index].title),
                  ),
                );
              }),
            );
          } else if (state is FailedToLoadPostsState) {
            return Center(
              child: Text('Error occured: ${state.error}'),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
