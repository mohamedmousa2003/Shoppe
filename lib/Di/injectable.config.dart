// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/api/api_manager.dart' as _i108;
import '../features/auth/data/data_sources/remote/auth_repo_data_source.dart'
    as _i77;
import '../features/auth/data/data_sources/remote/auth_repo_data_source_impl.dart'
    as _i328;
import '../features/auth/data/repositories/auth_repo_impl.dart' as _i990;
import '../features/auth/domain/repositories/repo_Auth.dart' as _i746;
import '../features/auth/domain/use_cases/login_used_case.dart' as _i825;
import '../features/auth/domain/use_cases/register_use_case.dart' as _i318;
import '../features/auth/presentation/cubit/cubit/login_cubit.dart' as _i880;
import '../features/auth/presentation/cubit/cubit/register_cubit.dart' as _i287;
import '../features/cart/data/data_sources/get_cart_data_source.dart' as _i62;
import '../features/cart/data/data_sources/get_cart_data_source_impl.dart'
    as _i931;
import '../features/cart/data/repositories/get_cart_repo_impl.dart' as _i535;
import '../features/cart/domain/repositories/get_cart_repo.dart' as _i102;
import '../features/cart/domain/use_cases/delete_cart.dart' as _i552;
import '../features/cart/domain/use_cases/get_cart_use_case.dart' as _i1030;
import '../features/cart/domain/use_cases/up_date_count_use_case.dart' as _i518;
import '../features/cart/presentation/cubit/cart_cubit.dart' as _i678;
import '../features/category/data/data_sources/remote/category_data_source.dart'
    as _i557;
import '../features/category/data/data_sources/remote/category_data_source_impl.dart'
    as _i37;
import '../features/category/data/repositories/category_repo_impl.dart'
    as _i824;
import '../features/category/domain/repositories/category_repo.dart' as _i367;
import '../features/category/domain/use_cases/add_to_cart.dart' as _i620;
import '../features/category/domain/use_cases/category_use_case.dart' as _i46;
import '../features/category/presentation/cubit/category_cubit.dart' as _i817;
import '../features/home/data/data_sources/home_data_source.dart' as _i704;
import '../features/home/data/data_sources/home_data_source_impl.dart' as _i468;
import '../features/home/data/repositories/home_repo_impl.dart' as _i21;
import '../features/home/domain/repositories/home_repo.dart' as _i770;
import '../features/home/domain/use_cases/brands_use_case.dart' as _i909;
import '../features/home/domain/use_cases/categorie_use_case.dart' as _i917;
import '../features/home/domain/use_cases/sub_get_categories_use_case.dart'
    as _i673;
import '../features/home/presentation/bloc/cubit/get_sub_categories_cubit.dart'
    as _i781;
import '../features/home/presentation/bloc/cubit/home_cubit.dart' as _i308;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i552.DeleteCartUseCase>(() => _i552.DeleteCartUseCase());
    gh.factory<_i1030.GetCartUseCase>(() => _i1030.GetCartUseCase());
    gh.factory<_i518.UpDateCountUseCase>(() => _i518.UpDateCountUseCase());
    gh.factory<_i678.CartCubit>(() => _i678.CartCubit());
    gh.factory<_i620.AddToCartUseCase>(() => _i620.AddToCartUseCase());
    gh.factory<_i308.HomeCubit>(() => _i308.HomeCubit());
    gh.singleton<_i108.ApiManager>(() => _i108.ApiManager());
    gh.factory<_i557.CategoryDataSource>(() => _i37.CategoryDataSourceImpl());
    gh.factory<_i77.AuthRepoDataSource>(
      () => _i328.AuthRepoDataSourceImpl(gh<_i108.ApiManager>()),
    );
    gh.factory<_i704.HomeDataSource>(
      () => _i468.HomeDataSourceImpl(gh<_i108.ApiManager>()),
    );
    gh.factory<_i367.CategoryRepo>(() => _i824.CategoryRepoImpl());
    gh.factory<_i62.GetCartDataSource>(() => _i931.GetCartDataSourceImpl());
    gh.factory<_i102.CartRepo>(() => _i535.GetCartRepoImpl());
    gh.factory<_i770.HomeRepo>(
      () => _i21.HomeRepoImpl(gh<_i704.HomeDataSource>()),
    );
    gh.factory<_i673.SubGetCategoriesUseCase>(
      () => _i673.SubGetCategoriesUseCase(gh<_i770.HomeRepo>()),
    );
    gh.factory<_i46.CategoryUseCase>(
      () => _i46.CategoryUseCase(gh<_i367.CategoryRepo>()),
    );
    gh.factory<_i917.CategoriesUseCase>(
      () => _i917.CategoriesUseCase(gh<_i770.HomeRepo>()),
    );
    gh.factory<_i746.RepoAuth>(
      () => _i990.AuthRepoImpl(gh<_i77.AuthRepoDataSource>()),
    );
    gh.factory<_i909.BrandsUseCase>(
      () => _i909.BrandsUseCase(homeRepo: gh<_i770.HomeRepo>()),
    );
    gh.factory<_i817.CategoryCubit>(
      () => _i817.CategoryCubit(gh<_i46.CategoryUseCase>()),
    );
    gh.factory<_i825.LoginUsedCase>(
      () => _i825.LoginUsedCase(repoAuth: gh<_i746.RepoAuth>()),
    );
    gh.factory<_i318.RegisterUseCase>(
      () => _i318.RegisterUseCase(repoAuth: gh<_i746.RepoAuth>()),
    );
    gh.factory<_i287.RegisterCubit>(
      () => _i287.RegisterCubit(gh<_i318.RegisterUseCase>()),
    );
    gh.factory<_i880.LoginCubit>(
      () => _i880.LoginCubit(loginUseCase: gh<_i825.LoginUsedCase>()),
    );
    gh.factory<_i781.GetSubCategoriesCubit>(
      () => _i781.GetSubCategoriesCubit(gh<_i673.SubGetCategoriesUseCase>()),
    );
    return this;
  }
}
