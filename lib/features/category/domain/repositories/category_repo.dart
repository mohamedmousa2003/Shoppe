import 'package:dartz/dartz.dart';
import 'package:e/core/exceptions/failures.dart';
import '../../data/models/CategoryModel.dart';

abstract class CategoryRepo {
  Future<Either<AppFailures , CategoryModel>> getCategoryRepo();
}