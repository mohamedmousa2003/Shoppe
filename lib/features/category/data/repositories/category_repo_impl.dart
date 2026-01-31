import 'package:dartz/dartz.dart';
import 'package:e/core/exceptions/failures.dart';
import 'package:e/features/category/data/data_sources/remote/category_data_source.dart';
import 'package:e/features/category/data/models/CategoryModel.dart';
import 'package:e/Di/injectable.dart';
import 'package:e/features/category/data/models/add_to_cart.dart';
import 'package:e/features/cart/data/models/delete_cart.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/category_repo.dart';

@Injectable(as: CategoryRepo)
class CategoryRepoImpl extends CategoryRepo {
  @override
  Future<Either<AppFailures, CategoryModel>> getCategoryRepo() async {
    try {
      final category = await getIt<CategoryDataSource>().getCategory();
      return right(category);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  //////////////////////////////// AddTo Cart /////////////////
  @override
  Future<Either<AppFailures, AddToCart>> addToCartRepo(String productId) async {
    try {
      final category = await getIt<CategoryDataSource>().addToCart(productId);
      return right(category);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }



}
