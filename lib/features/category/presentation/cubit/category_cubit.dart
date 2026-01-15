import 'package:e/features/category/presentation/cubit/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../Di/injectable.dart';
import '../../domain/use_cases/category_use_case.dart';

@injectable
class CategoryCubit extends Cubit<CategoryState> {
  CategoryUseCase categoryUseCase;
  CategoryCubit(this.categoryUseCase) :super(CategoryInitial());
  void getProduct()async{
   emit(CategoryLoading());

    final product = await getIt<CategoryUseCase>().call();
   product.fold(
          (failure) {
        emit(CategoryError(failure.message));
      }, (data) {
      emit(CategorySuccess(data));
    },
    );
 }
}