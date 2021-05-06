part of 'posts_page_cubit.dart';

@immutable
abstract class PostsPageState {
  const PostsPageState();
}

class PostsPageInitial extends PostsPageState {}

class PostsLoading extends PostsPageState {}

class PostsError extends PostsPageState {}

class PostsRefreshed extends PostsPageState {
  final List<Post> posts;
  const PostsRefreshed(this.posts);
}
