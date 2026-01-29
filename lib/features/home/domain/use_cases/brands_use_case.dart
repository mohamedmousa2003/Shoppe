import 'package:dartz/dartz.dart';
import 'package:e/features/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/exceptions/failures.dart';
import '../../data/models/ModelCategories.dart';

@injectable
class BrandsUseCase {
  HomeRepo homeRepo;
  BrandsUseCase({required this.homeRepo});

  Future<Either<AppFailures, ModelCategories>> call() => homeRepo.getBrands();
}