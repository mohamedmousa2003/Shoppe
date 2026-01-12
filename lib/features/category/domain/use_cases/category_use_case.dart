import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/exceptions/failures.dart';
import '../../data/models/CategoryModel.dart';
import '../repositories/category_repo.dart';

@injectable
class CategoryUseCase {
  CategoryRepo categoryRepo;
  CategoryUseCase(this.categoryRepo);
  Future<Either<AppFailures, CategoryModel>> call() => categoryRepo.getCategoryRepo();
}