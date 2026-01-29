import 'package:e/features/home/data/models/ModelCategories.dart';

abstract class HomeDataSource {
  Future<ModelCategories> getCategories();
  Future<ModelCategories> subGetCategories(String id);
  Future< ModelCategories> getBrands();
}