import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:q_project/features/posts/model/post.dart';
import 'package:q_project/injection/injection.dart';
import 'i_posts_local_service.dart';

@LazySingleton(
  as: IPostsLocalService,
  env: [AppEnvironment.dev, AppEnvironment.prod, AppEnvironment.staging],
)
class HivePostsLocalService implements IPostsLocalService {
  static const _hiveBoxName = 'posts';

  HivePostsLocalService() {
    Hive.registerAdapter(PostAdapter());
  }

  @override
  void clearCache() async {
    final hiveBox = await Hive.openBox<Post>(_hiveBoxName);
    hiveBox.clear();
    return;
  }

  @override
  Future<bool> pageCached(int page) async {
    print(page.toString());
    final hiveBox = await Hive.openBox<Post>(_hiveBoxName);
    if (hiveBox.values.isNotEmpty) {
      return (hiveBox.values.last.page >= page);
    } else {
      return false;
    }
  }

  @override
  void addPosts(List<Post> posts) async {
    final hiveBox = await Hive.openBox<Post>(_hiveBoxName);
    posts.forEach((comment) => hiveBox.add(comment));
    return;
  }

  @override
  Future<List<Post>> fetchPosts(int page) async {
    final hiveBox = await Hive.openBox<Post>(_hiveBoxName);
    final results = hiveBox.values.where((element) => element.page == page).toList();
    return results;
  }
}
