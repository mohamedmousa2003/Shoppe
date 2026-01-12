import 'package:cached_network_image/cached_network_image.dart';
import 'package:e/features/category/data/models/CategoryModel.dart';
import 'package:e/features/category/presentation/cubit/category_cubit.dart';
import 'package:e/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/category_state.dart';
import '../widgets/categories_list.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CategoryCubit>()..getProduct(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Categories"),
        ),
        body: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {

            /// 🔄 Loading
            if (state is CategoryLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            /// ❌ Error
            if (state is CategoryError) {
              return Center(child: Text(state.message));
            }

            /// ✅ Success
            if (state is CategorySuccess) {
              final categories = state.products.data;

              return ListView.builder(
                padding: EdgeInsets.all(16.w),
                itemCount: categories?.length ??0,
                itemBuilder: (context, index) {
                  final category = categories![index];

                  return CategoryItem(category: category);
                },
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
