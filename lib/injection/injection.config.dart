// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/posts/presentation/cubit/posts_page_cubit.dart' as _i9;
import '../repositories/i_posts_repository.dart' as _i7;
import '../repositories/posts_repository.dart' as _i8;
import '../services/i_posts_api_service.dart' as _i3;
import '../services/i_posts_local_service.dart' as _i5;
import '../services/posts_api_service.dart' as _i4;
import '../services/posts_local_service.dart' as _i6;

const String _dev = 'dev';
const String _prod = 'prod';
const String _staging = 'staging';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.IPostsApiService>(() => _i4.PostsApiService());
  gh.lazySingleton<_i5.IPostsLocalService>(() => _i6.HivePostsLocalService(),
      registerFor: {_dev, _prod, _staging});
  gh.lazySingleton<_i7.IPostsRepository>(
      () => _i8.PostsRepository(
          get<_i3.IPostsApiService>(), get<_i5.IPostsLocalService>()),
      registerFor: {_dev, _prod, _staging});
  gh.factory<_i9.PostsPageCubit>(
      () => _i9.PostsPageCubit(get<_i7.IPostsRepository>()));
  return get;
}
