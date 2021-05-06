import 'package:injectable/injectable.dart';
import 'package:q_project/features/posts/model/post.dart';
import 'package:q_project/injection/injection.dart';
import 'package:q_project/repositories/i_posts_repository.dart';
import 'package:q_project/services/i_posts_api_service.dart';
import 'package:q_project/services/i_posts_local_service.dart';

@LazySingleton(
  as: IPostsRepository,
  env: [AppEnvironment.dev, AppEnvironment.prod, AppEnvironment.staging],
)
class PostsRepository implements IPostsRepository {
  PostsRepository(this._apiService, this._localService);

  final IPostsApiService _apiService;
  final IPostsLocalService _localService;

  static const firstPageIndex = 1;

  @override
  Future<List<Post>> getNextPage(int page) async {
    final pageCached = await _localService.pageCached(page);

    List<Post> posts;
    if (pageCached) {
      posts = await _localService.fetchPosts(page);
    } else {
      posts = await _fetchApiPosts(page);
    }
    return posts;
  }

  @override
  Future<List<Post>> refresh() async {
    _localService.clearCache();
    return _fetchApiPosts(firstPageIndex);
  }

  Future<List<Post>> _fetchApiPosts(int page) async {
    List<Post> posts;
    final postsDTO = await _apiService.fetchPosts(page);
    posts = postsDTO.map((dto) => Post.fromDTO(dto)).toList();
    _localService.addPosts(posts);
    return posts;
  }
}
