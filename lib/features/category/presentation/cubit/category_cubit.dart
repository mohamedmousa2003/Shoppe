import 'package:e/core/exceptions/failures.dart';
import 'package:e/features/cart/domain/use_cases/delete_cart.dart';
import 'package:e/features/category/presentation/cubit/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../Di/injectable.dart';
import '../../domain/use_cases/add_to_cart.dart';
import '../../domain/use_cases/category_use_case.dart';

@injectable
class CategoryCubit extends Cubit<CategoryState> {
  CategoryUseCase categoryUseCase;
  CategoryCubit(this.categoryUseCase) : super(CategoryInitial());
  void getProduct() async {
    emit(CategoryLoading());

    final product = await getIt<CategoryUseCase>().call();
    product.fold(
      (failure) {
        emit(CategoryError(RemoteFailures(failure.message)));
      },
      (data) {
        emit(CategorySuccess(data));
      },
    );
  }


  ///////////////////////////////// Add To Cart //////////////////////
  void addToCart({required String productId}) async {
    emit(AddCartLoading());
    var cart = await getIt<AddToCartUseCase>().call(productId);
    cart.fold(
      (l) {
        emit(CategoryError(RemoteFailures(l.message)));
      },
      (r) {
        emit(AddCartSuccess(r));
      },
    );
  }



}
