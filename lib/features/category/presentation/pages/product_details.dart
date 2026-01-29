import 'package:e/Di/injectable.dart';
import 'package:e/core/styles/styles.dart';
import 'package:e/features/category/presentation/cubit/category_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../../../core/commom/widget/size_box.dart';
import '../../../../core/constant/text.dart';
import '../../../../core/styles/app_dailog.dart';
import '../../../../core/styles/colors.dart';
import '../../data/models/CategoryModel.dart';
import '../cubit/category_cubit.dart';

class ProductDetails extends StatelessWidget {
  static const String routeName = "ProductDetails";
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as CategoryData?;

    if (args == null) {
      return const Scaffold(
        body: Center(child: Text("No product data")),
      );
    }

    final images = args.images ?? [];
    final id = args.id;

    return BlocProvider(
      create: (_) => getIt<CategoryCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            productDetails,
            style: AppTextStyles.elMessIri20.copyWith(
              color: MyColors.bluePrimary,
              fontSize: 25,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.search,
                color: MyColors.bluePrimary,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                color: MyColors.bluePrimary,
                size: 30,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Images
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: images.isEmpty
                      ? Container(
                    height: 250.h,
                    color: MyColors.white,
                    child: const Center(
                      child: Text("No images available"),
                    ),
                  )
                      : ImageSlideshow(
                    width: double.infinity,
                    height: 450.h,
                    indicatorColor: MyColors.bluePrimary,
                    indicatorBackgroundColor: MyColors.greyDark,
                    autoPlayInterval: 4000,
                    isLoop: true,
                    children: images
                        .map(
                          (url) => Image.network(
                        url,
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                    )
                        .toList(),
                  ),
                ),

                const CustomSizedBox(height: 20),

                /// Title + Price
                Row(
                  children: [
                    Text(
                      firstTwoWords(args.title),
                      style: AppTextStyles.elMessIri20.copyWith(
                        color: MyColors.bluePrimary,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "EGP ${args.price}",
                      style: AppTextStyles.elMessIri20.copyWith(
                        fontWeight: FontWeight.bold,
                        color: MyColors.bluePrimary,
                      ),
                    ),
                  ],
                ),

                const CustomSizedBox(height: 8),

                /// Rating + Quantity
                Row(
                  children: [
                    Text(
                      "${args.ratingsAverage} ⭐ (${args.ratingsQuantity})",
                      style: AppTextStyles.textStyle20.copyWith(
                        color: MyColors.greyDark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 150.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: MyColors.blue,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            CupertinoIcons.add_circled,
                            color: MyColors.white,
                            size: 30,
                          ),
                          Text(
                            args.quantity.toString(),
                            style: AppTextStyles.textStyle20,
                          ),
                          Icon(
                            CupertinoIcons.minus_circled,
                            color: MyColors.white,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const CustomSizedBox(height: 15),

                /// Description
                Text(
                  description,
                  style: AppTextStyles.elMessIri20.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: MyColors.bluePrimary,
                  ),
                ),
                ReadMoreText(
                  args.description ?? "No description",
                  trimMode: TrimMode.Line,
                  trimLines: 2,
                  trimCollapsedText: ' Show more',
                  trimExpandedText: ' Show less',
                  style: AppTextStyles.textStyle14.copyWith(
                    color: MyColors.greyDark,
                  ),
                  moreStyle: AppTextStyles.textStyle18.copyWith(
                    color: MyColors.bluePrimary,
                  ),
                ),

                const CustomSizedBox(height: 40),

                /// Total + Add to cart
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          totalPrice,
                          style: AppTextStyles.elMessIri20.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: MyColors.blue,
                          ),
                        ),
                        const CustomSizedBox(height: 5),
                        Text(
                          "EGP ${args.price}",
                          style: AppTextStyles.elMessIri20.copyWith(
                            fontWeight: FontWeight.bold,
                            color: MyColors.bluePrimary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 30.w),

                    /// Button
                    Expanded(
                      child: BlocBuilder<CategoryCubit, CategoryState>(
                        builder: (context, state) {
                          if (state is AddCartLoading) {
                            return ElevatedButton(
                              onPressed: null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MyColors.greyDark,
                              ),
                              child: Padding(
                                padding:
                                EdgeInsets.symmetric(vertical: 15.h),
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }

                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: MyColors.blue,
                            ),
                            onPressed: () {
                              context.read<CategoryCubit>().addToCart(productId:id!);
                              AppDialog.showSnackBar(context, "Added to cart successfully ✅");
                            },
                            child: Padding(
                              padding:
                              EdgeInsets.symmetric(vertical: 15.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_shopping_cart_outlined,
                                    color: MyColors.white,
                                    size: 30,
                                  ),
                                  SizedBox(width: 20.w),
                                  Text(
                                    "Add to Cart",
                                    style: AppTextStyles.textStyle20,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String firstTwoWords(String? text) {
    if (text == null || text.trim().isEmpty) return "";
    final words = text.trim().split(RegExp(r'\s+'));
    return words.length <= 2 ? words.join(' ') : '${words[0]} ${words[1]}...';
  }
}
