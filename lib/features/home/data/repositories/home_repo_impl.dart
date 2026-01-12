import 'package:dartz/dartz.dart';
import 'package:e/core/exceptions/failures.dart';
import 'package:e/features/home/data/data_sources/home_data_source.dart';
import 'package:e/features/home/data/models/ModelCategories.dart';
import 'package:e/features/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo{

  HomeDataSource homeDataSource;
  HomeRepoImpl(this.homeDataSource);

  @override
  Future<Either<AppFailures, ModelCategories>> getCategories() async {
    try{
      final getCategories = await homeDataSource.getCategories();
      return right(getCategories);
    }catch(e){
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<AppFailures, ModelCategories>> subGetCategories(String id) async{
    try{
      final getSubCategories =await homeDataSource.subGetCategories(id);
      return right(getSubCategories);
    } catch(e){
      return Left(RemoteFailures(e.toString()));
    }
  }

}