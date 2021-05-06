import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:q_project/features/posts/model/dto/post_dto.dart';
import 'package:q_project/injection/injection.dart';
import 'package:q_project/services/i_posts_api_service.dart';
import 'dio_service.dart';

@LazySingleton(
  as: IPostsApiService,
  env: [AppEnvironment.dev, AppEnvironment.prod, AppEnvironment.staging],
)
class PostsApiService implements IPostsApiService {
  final Dio _dio = DioService().dio;

  static const _baseUrl = 'https://jsonplaceholder.typicode.com';

  @override
  Future<List<PostDTO>> fetchPosts(int page) async {
    final result =
        await _dio.get(_baseUrl + '/comments?postId=' + page.toString());

    List<PostDTO> posts;

    if (result.statusCode == 200) {
      posts = List<PostDTO>.from(result.data
          .map((item) => PostDTO.fromJson(item as Map<String, dynamic>)));
    }

    return posts;
  }
}
