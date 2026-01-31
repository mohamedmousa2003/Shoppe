import 'package:cached_network_image/cached_network_image.dart';
import 'package:e/core/styles/styles.dart';
import 'package:e/features/category/presentation/pages/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Di/injectable.dart';
import '../../../../core/commom/widget/size_box.dart';
import '../../../../core/styles/app_dailog.dart';
import '../../../../core/styles/colors.dart';
import '../cubit/category_cubit.dart';
import '../cubit/category_state.dart';

class CategoryScreen extends StatelessWidget {
  static const String routeName = "CategoryScreen";
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => getIt<CategoryCubit>()..getProduct(),
      child: Scaffold(
        body: BlocListener<CategoryCubit, CategoryState>(
          listener: (context, state) {
            if (state is CategoryLoading) {
              // Optionally, show a loading dialog if you want
            } else {
              // Hide any loading indicator
            }

            if (state is AddCartSuccess) {
               AppDialog.showSnackBar(context, "Added to cart successfully ✅");
            }

            if (state is CategoryError) {
              AppDialog.showMessage(context: context, message: state.message.message);

            }
          },
          child: BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              // Loading UI
              if (state is CategoryLoading) {
                return const Center(child: CircularProgressIndicator());
              }



              if (state is CategorySuccess) {
                final categories = state.products.data ?? [];

                return GridView.builder(
                  padding: EdgeInsets.all(8.w),
                  itemCount: categories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.67,
                  ),
                  itemBuilder: (context, index) {
                    final category = categories[index];

                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          ProductDetails.routeName,
                          arguments: category,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: MyColors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            width: 2.w,
                            color: MyColors.bluePrimary.withOpacity(0.3),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Image
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                CachedNetworkImage(
                                  height: 180.h,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                  imageUrl: category.images?.last ?? "",
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(
                                      color: MyColors.bluePrimary,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                  const Center(child: Icon(Icons.error)),
                                ),
                                Positioned(
                                  top: mediaQuery.height * 0.01,
                                  right: mediaQuery.width * 0.02,
                                  child: const Icon(Icons.favorite_border),
                                )
                              ],
                            ),
                            const CustomSizedBox(height: 8),

                            // Title
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                              child: Text(
                                category.title ?? "No Title",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.elMessIri20.copyWith(
                                  color: MyColors.bluePrimary,
                                ),
                              ),
                            ),
                            const CustomSizedBox(height: 4),

                            // Description
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                              child: Text(
                                category.description ?? "",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.elMessIri18.copyWith(
                                  color: MyColors.bluePrimary.withOpacity(0.7),
                                ),
                              ),
                            ),
                            const CustomSizedBox(height: 6),

                            // Price
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                              child: Text(
                                "EGP ${category.price}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.elMessIri20.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.bluePrimary,
                                ),
                              ),
                            ),
                            const Spacer(),

                            // Rating
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 6.w,
                                vertical: 6.h,
                              ),
                              child: Expanded(
                                child: Text(
                                  'Review (${category.ratingsAverage}) ⭐',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.elMessIri20.copyWith(
                                    color: MyColors.bluePrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
