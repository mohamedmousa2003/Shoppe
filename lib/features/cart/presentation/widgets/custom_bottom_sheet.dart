import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/commom/widget/size_box.dart';
import '../../../../core/constant/text.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/styles.dart';
import '../cubit/cart_cubit.dart';
import '../cubit/cart_state.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(16.w),
        height: 150.h,
        decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(30.r),
            topStart: Radius.circular(30.r),
          ),
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Colors.black12,
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  totalPrice,
                  style: AppTextStyles.elMessIri20.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: MyColors.blue,
                  ),
                ),
                const CustomSizedBox(height: 5),

                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    if (state is GetCartSuccess) {
                      return Text(
                        "EGP ${state.getCart.data?.totalCartPrice ?? 0}",
                        style: AppTextStyles.elMessIri20.copyWith(
                          fontWeight: FontWeight.bold,
                          color: MyColors.bluePrimary,
                          fontSize: 22,
                        ),
                      );
                    }

                    if (state is GetCartLoading) {
                      return const CircularProgressIndicator();
                    }

                    return const Text("EGP 0");
                  },
                ),
              ],
            ),

            SizedBox(width: 30.w),

            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.blue,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      checkOut,
                      style: AppTextStyles.textStyle20.copyWith(
                        color: MyColors.white,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    const Icon(
                      CupertinoIcons.arrow_right,
                      color: MyColors.white,
                      size: 25,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
