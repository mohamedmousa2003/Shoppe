import 'package:dartz/dartz.dart';
import 'package:e/core/exceptions/failures.dart';
import 'package:e/features/home/data/models/ModelCategories.dart';
import 'package:injectable/injectable.dart';

import '../repositories/home_repo.dart';
@injectable
class CategoriesUseCase {
  HomeRepo homeRepo;
  CategoriesUseCase(this.homeRepo);

  Future<Either<AppFailures ,ModelCategories>> call(){
    return homeRepo.getCategories();
  }
}