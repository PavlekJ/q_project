

import 'package:q_project/features/posts/model/post.dart';

abstract class IPostsRepository {
  Future<List<Post>> getNextPage(int page);
  Future<List<Post>> refresh();
}