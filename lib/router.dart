
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:q_project/features/posts/presentation/cubit/posts_page_cubit.dart';
import 'package:q_project/features/posts/presentation/pages/posts_page.dart';

final routes = {
  PostsPage.routeName: (_) => BlocProvider<PostsPageCubit>(
        create: (_) => GetIt.instance<PostsPageCubit>(),
        child: PostsPage(),
      ),
};
