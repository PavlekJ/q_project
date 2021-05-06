import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:q_project/features/posts/model/post.dart';
import 'package:q_project/repositories/i_posts_repository.dart';

part 'posts_page_state.dart';

@injectable
class PostsPageCubit extends Cubit<PostsPageState> {
  PostsPageCubit(this._postsRepository) : super(PostsPageInitial()) {
    loadNextPage();
  }

  final IPostsRepository _postsRepository;

  var page = 1;
  List<Post> posts = <Post>[];

  Future<void> refresh() async {
    page = 1;
    posts = <Post>[];

    emit(PostsLoading());
    var newPosts = await _postsRepository.refresh();

    if (newPosts != null) {
      page++;
      posts.addAll(newPosts);
      emit(PostsRefreshed(posts));
    } else {
      emit(PostsError());
    }
  }

  Future loadNextPage() async {
    emit(PostsLoading());
    var newPosts = await _postsRepository.getNextPage(page);

    if (newPosts != null) {
      page++;
      posts.addAll(newPosts);
      emit(PostsRefreshed(posts));
    } else {
      emit(PostsError());
    }
  }
}
