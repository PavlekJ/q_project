import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_project/features/posts/model/post.dart';
import 'package:q_project/features/posts/presentation/cubit/posts_page_cubit.dart';
import 'package:q_project/features/posts/presentation/widgets/post_card.dart';
import 'package:q_project/constants/app_strings.dart' as strings;

class PostsPage extends StatelessWidget {
  static const routeName = '/';

  var _scrollOffset = 0.0;

  PostsPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).cardColor,
          title: Text(strings.posts),
        ),
        body: Stack(
          children: [
            Center(
                child: BlocBuilder<PostsPageCubit, PostsPageState>(
              buildWhen: (_, current) => current is PostsRefreshed,
              builder: (context, state) {
                if (state is PostsRefreshed) {
                  return _buildTableView(state.posts, context);
                } else {
                  return SizedBox();
                }
              },
            )),
            BlocBuilder<PostsPageCubit, PostsPageState>(
              builder: (context, state) {
                if (state is PostsLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SizedBox();
                }
              },
            )
          ],
        ));
  }

  void showPostDialog(post, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).cardColor,
        title: Text(
          post.email,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        content: Text(
          post.message,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }

  Widget _buildTableView(List<Post> posts, BuildContext context) {
    var controller = ScrollController(initialScrollOffset: _scrollOffset);
    controller.addListener(() {
      if (controller.position.atEdge && controller.position.pixels != 0) {
        _scrollOffset = controller.position.pixels;
        context.read<PostsPageCubit>().loadNextPage();
      }
    });

    return RefreshIndicator(
        child: Scrollbar(
          child: ListView.builder(
            controller: controller,
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  showPostDialog(posts[index], context);
                },
                child: Container(
                  child: PostCard(post: posts[index]),
                ),
              );
            },
          ),
        ),
        onRefresh: () => context.read<PostsPageCubit>().refresh());
  }
}
