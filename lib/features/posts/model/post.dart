import 'package:hive/hive.dart';
import 'package:q_project/features/posts/model/dto/post_dto.dart';

part 'post.g.dart';

@HiveType(typeId: 0)
class Post {

  static String avatar = 'package:assets/images/default_user.jpg';

  @HiveField(0)
  final String email;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String message;

  @HiveField(3)
  final int page;

  Post(this.email, this.name, this.message, this.page);

  static Post fromDTO(PostDTO dto) {
    return Post(dto.email, dto.name, dto.body, dto.postId);
  }

}
