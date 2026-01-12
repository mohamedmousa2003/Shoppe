import 'package:e/features/category/data/models/CategoryModel.dart';

abstract class CategoryDataSource {
  Future<CategoryModel> getCategory();
}