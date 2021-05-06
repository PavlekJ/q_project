

import 'package:q_project/features/posts/model/dto/post_dto.dart';

abstract class IPostsApiService {
  Future<List<PostDTO>> fetchPosts(int page);
}