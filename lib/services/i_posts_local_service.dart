
import 'package:q_project/features/posts/model/post.dart';

abstract class IPostsLocalService {

  void clearCache();
  Future<bool> pageCached(int page);
  Future<List<Post>> fetchPosts(int page);
  void addPosts(List<Post> posts);

}