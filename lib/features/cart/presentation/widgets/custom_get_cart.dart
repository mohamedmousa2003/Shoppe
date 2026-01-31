import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/images_assets.dart';
import '../../../../core/styles/app_dailog.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/styles.dart';
import '../cubit/cart_cubit.dart';
import '../cubit/cart_state.dart';


class CustomGetCart extends StatelessWidget {
  const CustomGetCart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        // 🔄 Loading
        if (state is GetCartLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // ❌ Error
        if (state is GetCartError) {
          return Center(
            child: Text(
              state.message.message,
              style: AppTextStyles.textStyle18.copyWith(
                color: MyColors.red,
              ),
              textAlign: TextAlign.center,
            ),
          );
        }

        // ✅ Success
        if (state is GetCartSuccess) {
          final products = state.getCart.data?.products ?? [];

          if (products.isEmpty) {
            return Center(
              child: Text(
                "Cart is empty",
                style: AppTextStyles.textStyle20.copyWith(
                  color: MyColors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),
              ),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return _buildCartItem(product, context);
            },
          );
        }

        return const SizedBox();
      },
    );
  }

  Widget _buildCartItem(product, BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
      height: 150.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: MyColors.blue, width: 2),
      ),
      child: Row(
        children: [
          product.product?.imageCover != null
              ? Image.network(
            product.product!.imageCover!,
            height: double.infinity,
            width: 150.w,
            fit: BoxFit.fill,
          )
              : Image.asset(
            ImagePng.imageSlider2,
            height: double.infinity,
            width: 150.w,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(6.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          product.product?.title ?? 'No name',
                          style: AppTextStyles.textStyle20.copyWith(
                            color: MyColors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<CartCubit>().deleteProduct(cartItemId: product.product!.id!,);
                          AppDialog.showSnackBar(context, "Delete to cart successfully 🗑️");
                        },
                        child: const Icon(
                          CupertinoIcons.delete,
                          color: MyColors.red,
                          size: 26,
                        ),
                      ),

                    ],
                  ),
                  Text(
                    "EGP ${product.price ?? 0}",
                    style: AppTextStyles.textStyle20.copyWith(
                      color: MyColors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "${product.product?.ratingsAverage ?? 0} ⭐",
                        style: AppTextStyles.textStyle20.copyWith(
                          color: MyColors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 130.w,
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: MyColors.blue,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                int count =product.count;
                                count++;
                                context.read<CartCubit>().upDataCount(
                                  productID: product.product!.id!,
                                  count: count,
                                );
                              },
                              child: Icon(
                                CupertinoIcons.add_circled,
                                color: MyColors.white,
                                size: 26,
                              ),
                            ),
                            Text(
                              "${product.count ?? 1}",
                              style: AppTextStyles.textStyle20.copyWith(
                                color: MyColors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                int count =product.count;
                                count--;
                                context.read<CartCubit>().upDataCount(
                                  productID: product.product!.id!,
                                  count: count,
                                );
                              },
                              child: Icon(
                                CupertinoIcons.minus_circled,
                                color: MyColors.white,
                                size: 26,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
