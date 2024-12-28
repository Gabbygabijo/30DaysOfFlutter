import 'package:aflutterapp/data_service.dart';
import 'package:aflutterapp/post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class PostsEvent {}

class LoadPostsEvent extends PostsEvent {}

class PullToRefreshEvent extends PostsEvent {}

abstract class PostsState {}

class LoadingPostsState extends PostsState {}

class LoadedPostsState extends PostsState {
  final List<Post> posts;
  LoadedPostsState({required this.posts});
}

class FailedToLoadPostsState extends PostsState {
  final Exception error;
  FailedToLoadPostsState({required this.error});
}

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final DataService _dataService;

  PostsBloc(this._dataService) : super(LoadingPostsState()) {
    on<LoadPostsEvent>(_onLoadPostsEvent);
    on<PullToRefreshEvent>(_onLoadPostsEvent);
  }

  Future<void> _onLoadPostsEvent(PostsEvent event, Emitter<PostsState> emit) async {
    emit(LoadingPostsState());

    try {
      final posts = await _dataService.getPosts();
      emit(LoadedPostsState(posts: posts));
    } catch (e) {
      emit(FailedToLoadPostsState(error: Exception(e.toString())));
    }
  }
}
