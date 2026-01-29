import 'package:dartz/dartz.dart';
import 'package:e/core/exceptions/failures.dart';
import 'package:e/core/exceptions/result.dart';
import 'package:e/features/home/data/models/ModelCategories.dart';

abstract interface class HomeRepo {

  Future<Either<AppFailures , ModelCategories>> getCategories();
  Future<Either<AppFailures , ModelCategories>> getBrands();
  Future<Either<AppFailures , ModelCategories>> subGetCategories(String id);

}


 abstract  interface class HomeRepo2 {

  Future<Result<ModelCategories>> getCategories();


}
