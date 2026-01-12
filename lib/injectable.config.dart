import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/api/api_manager.dart' as _i237;
import 'features/auth/data/data_sources/remote/auth_repo_data_source.dart'
    as _i704;
import 'features/auth/data/data_sources/remote/auth_repo_data_source_impl.dart'
    as _i908;
import 'features/auth/data/repositories/auth_repo_impl.dart' as _i426;
import 'features/auth/domain/repositories/repo_Auth.dart' as _i450;
import 'features/auth/domain/use_cases/login_used_case.dart' as _i844;
import 'features/auth/domain/use_cases/register_use_case.dart' as _i87;
import 'features/auth/presentation/cubit/cubit/login_cubit.dart' as _i254;
import 'features/auth/presentation/cubit/cubit/register_cubit.dart' as _i48;
import 'features/category/data/data_sources/remote/category_data_source.dart'
    as _i58;
import 'features/category/data/data_sources/remote/category_data_source_impl.dart'
    as _i903;
import 'features/category/data/repositories/category_repo_impl.dart' as _i809;
import 'features/category/domain/repositories/category_repo.dart' as _i581;
import 'features/category/domain/use_cases/category_use_case.dart' as _i714;
import 'features/category/presentation/cubit/category_cubit.dart' as _i478;
import 'features/home/data/data_sources/home_data_source.dart' as _i472;
import 'features/home/data/data_sources/home_data_source_impl.dart' as _i696;
import 'features/home/data/repositories/home_repo_impl.dart' as _i689;
import 'features/home/domain/repositories/home_repo.dart' as _i806;
import 'features/home/domain/use_cases/categorie_use_case.dart' as _i623;
import 'features/home/domain/use_cases/sub_get_categories_use_case.dart'
    as _i650;
import 'features/home/presentation/bloc/cubit/get_sub_categories_cubit.dart'
    as _i811;
import 'features/home/presentation/bloc/cubit/home_cubit.dart' as _i713;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i237.ApiManager>(() => _i237.ApiManager());
    gh.factory<_i58.CategoryDataSource>(() => _i903.CategoryDataSourceImpl());
    gh.factory<_i704.AuthRepoDataSource>(
      () => _i908.AuthRepoDataSourceImpl(gh<_i237.ApiManager>()),
    );
    gh.factory<_i472.HomeDataSource>(
      () => _i696.HomeDataSourceImpl(gh<_i237.ApiManager>()),
    );
    gh.factory<_i806.HomeRepo>(
      () => _i689.HomeRepoImpl(gh<_i472.HomeDataSource>()),
    );
    gh.factory<_i581.CategoryRepo>(
      () => _i809.CategoryRepoImpl(gh<_i58.CategoryDataSource>()),
    );
    gh.factory<_i650.SubGetCategoriesUseCase>(
      () => _i650.SubGetCategoriesUseCase(gh<_i806.HomeRepo>()),
    );
    gh.factory<_i714.CategoryUseCase>(
      () => _i714.CategoryUseCase(gh<_i581.CategoryRepo>()),
    );
    gh.factory<_i623.CategoriesUseCase>(
      () => _i623.CategoriesUseCase(gh<_i806.HomeRepo>()),
    );
    gh.factory<_i450.RepoAuth>(
      () => _i426.AuthRepoImpl(gh<_i704.AuthRepoDataSource>()),
    );
    gh.factory<_i478.CategoryCubit>(
      () => _i478.CategoryCubit(gh<_i714.CategoryUseCase>()),
    );
    gh.factory<_i844.LoginUsedCase>(
      () => _i844.LoginUsedCase(repoAuth: gh<_i450.RepoAuth>()),
    );
    gh.factory<_i87.RegisterUseCase>(
      () => _i87.RegisterUseCase(repoAuth: gh<_i450.RepoAuth>()),
    );
    gh.factory<_i48.RegisterCubit>(
      () => _i48.RegisterCubit(gh<_i87.RegisterUseCase>()),
    );
    gh.factory<_i254.LoginCubit>(
      () => _i254.LoginCubit(loginUseCase: gh<_i844.LoginUsedCase>()),
    );
    gh.factory<_i713.HomeCubit>(
      () => _i713.HomeCubit(gh<_i623.CategoriesUseCase>()),
    );
    gh.factory<_i811.GetSubCategoriesCubit>(
      () => _i811.GetSubCategoriesCubit(gh<_i650.SubGetCategoriesUseCase>()),
    );
    return this;
  }
}
