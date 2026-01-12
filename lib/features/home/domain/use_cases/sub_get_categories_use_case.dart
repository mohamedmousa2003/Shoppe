
import 'package:dartz/dartz.dart';
import 'package:e/features/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/exceptions/failures.dart';
import '../../data/models/ModelCategories.dart';

@injectable
class SubGetCategoriesUseCase {
  final HomeRepo _homeRepo;
  SubGetCategoriesUseCase(this._homeRepo);

  Future<Either<AppFailures, ModelCategories>> call(String id)=>_homeRepo.subGetCategories(id);
}